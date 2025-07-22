// Configuration
let config = {
    pages: "\"400 Daily Notes\"",  // Only look in the Daily Notes folder
    showCompleted: false           // Hide completed tasks
};

// Create the header
dv.header(1, "📋 GTD");

// Get all tasks with their source info
let pages = dv.pages(config.pages);
let allTasks = pages.file.tasks;

// Filter out completed tasks if needed
let filteredTasks = config.showCompleted ? allTasks : allTasks.filter(t => !t.completed);

// Filter out #mlg tasks from daily notes
filteredTasks = filteredTasks.filter(task => !task.text.includes("#mlg"));

// Extract all tags from tasks
const tagMap = {};
tagMap["All"] = filteredTasks; // Default option for all tasks

// Group tasks by tags
filteredTasks.forEach(task => {
    // Extract tags with regex
    const tagRegex = /#([a-zA-Z0-9_-]+)/g;
    const matches = [...task.text.matchAll(tagRegex)];

    if (matches.length > 0) {
        matches.forEach(match => {
            const tag = match[1];
            if (!tagMap[tag]) {
                tagMap[tag] = [];
            }
            tagMap[tag].push(task);
        });
    } else {
        // Tasks with no tags go into "Untagged" category
        if (!tagMap["Untagged"]) {
            tagMap["Untagged"] = [];
        }
        tagMap["Untagged"].push(task);
    }
});

// Sort tags alphabetically, but keep "All" at top and "Untagged" at bottom
const sortedTags = Object.keys(tagMap).sort((a, b) => {
    if (a === "All") return -1;
    if (b === "All") return 1;
    if (a === "Untagged") return 1;
    if (b === "Untagged") return -1;
    return a.localeCompare(b);
});

// Create filter buttons
let buttonsContainer = dv.el("div", "", {cls: "task-tag-buttons"});
buttonsContainer.style.display = "flex";
buttonsContainer.style.flexWrap = "wrap";
buttonsContainer.style.gap = "8px";
buttonsContainer.style.marginBottom = "15px";

// Initial active tag (start with "All")
let activeTag = "All";

// Function to toggle task completion
async function toggleTask(task, checkbox) {
    try {
        // Get the file
        const file = app.vault.getAbstractFileByPath(task.path);
        if (!file) return;

        // Read the file content
        let content = await app.vault.read(file);

        // Split into lines
        const lines = content.split('\n');

        // Get the line of the task
        const taskLine = lines[task.line];

        // Toggle the checkbox state in the line
        let newTaskLine;
        if (taskLine.includes('[ ]')) {
            newTaskLine = taskLine.replace('[ ]', '[x]');
        } else if (taskLine.includes('[x]')) {
            newTaskLine = taskLine.replace('[x]', '[ ]');
        } else {
            // For other formats like uppercase X or spaces
            newTaskLine = taskLine.replace(/\[([ xX])\]/g, (match, char) => {
                return char.trim().toLowerCase() === 'x' ? '[ ]' : '[x]';
            });
        }

        // Update the line
        lines[task.line] = newTaskLine;

        // Join lines back together
        const newContent = lines.join('\n');

        // Write the updated content to the file
        await app.vault.modify(file, newContent);

        // Update the checkbox visual state
        checkbox.checked = !task.completed;

        // Refresh dataview to reflect changes
        setTimeout(() => dv.refresh(), 300);

    } catch (error) {
        console.error("Error toggling task:", error);
    }
}

// Function to render tasks for a specific tag
function renderTasks(tag) {
    // Clear previous tasks
    if (tasksContainer) {
        while (tasksContainer.firstChild) {
            tasksContainer.removeChild(tasksContainer.firstChild);
        }
    }

    // Get tasks for the tag
    const tasksToRender = tagMap[tag] || [];

    // Create a list with proper indentation for task hierarchy
    if (tasksToRender.length === 0) {
        tasksContainer.createEl("p", {text: "No tasks found for this tag."});
        return;
    }

    // Sort tasks by path and line to maintain some consistency
    const sortedTasks = [...tasksToRender].sort((a, b) => {
        if (a.path !== b.path) return a.path.localeCompare(b.path);
        return a.line - b.line;
    });

    // Create a list
    const taskList = tasksContainer.createEl("div", {cls: "task-list"});

    // Render tasks without file grouping
    sortedTasks.forEach(task => {
        // Create task container with proper indentation
        const taskDiv = taskList.createEl("div", {cls: "task-item"});
        taskDiv.style.marginLeft = `${task.depth * 20}px`;
        taskDiv.style.display = "flex";
        taskDiv.style.alignItems = "flex-start";
        taskDiv.style.marginBottom = "4px";

        // Create checkbox
        const checkbox = taskDiv.createEl("input", {
            type: "checkbox",
            checked: task.completed
        });
        checkbox.style.marginRight = "8px";
        checkbox.style.marginTop = "4px";

        // Add click event to checkbox
        checkbox.addEventListener("click", (e) => {
            e.stopPropagation(); // Prevent the click from bubbling
            toggleTask(task, checkbox);
        });

        // Create task text container
        const textContainer = taskDiv.createEl("div", {cls: "task-text-container"});
        textContainer.style.display = "flex";
        textContainer.style.flexWrap = "wrap";
        textContainer.style.alignItems = "center";

        // Get task text without checkbox markdown
        const taskText = task.text.replace(/^\s*-\s*\[\s*[\sxX]?\s*\]\s*/, "");

        // Split the task text by tags and create styled elements for each part
        const tagRegex = /#([a-zA-Z0-9_-]+)/g;
        let lastIndex = 0;
        let match;

        // First check if there are any tags
        const hasMatches = tagRegex.test(taskText);
        tagRegex.lastIndex = 0; // Reset regex index after test

        if (hasMatches) {
            while ((match = tagRegex.exec(taskText)) !== null) {
                // Add the text before the tag
                if (match.index > lastIndex) {
                    const beforeText = taskText.substring(lastIndex, match.index);
                    const textSpan = textContainer.createEl("span");
                    textSpan.textContent = beforeText;
                    if (task.completed) {
                        textSpan.style.textDecoration = "line-through";
                        textSpan.style.color = "var(--text-faint)";
                    }
                }

                // Add the tag with styling
                const tagSpan = textContainer.createEl("span", {cls: "task-tag"});
                tagSpan.style.backgroundColor = "var(--background-secondary-alt)";
                tagSpan.style.color = "var(--text-accent)";
                tagSpan.style.padding = "0px 4px";
                tagSpan.style.borderRadius = "4px";
                tagSpan.style.margin = "0 2px";
                tagSpan.style.fontWeight = "500";
                tagSpan.textContent = match[0]; // The full tag with #

                if (task.completed) {
                    tagSpan.style.textDecoration = "line-through";
                    tagSpan.style.opacity = "0.7";
                }

                lastIndex = match.index + match[0].length;
            }

            // Add any remaining text after the last tag
            if (lastIndex < taskText.length) {
                const afterText = taskText.substring(lastIndex);
                const textSpan = textContainer.createEl("span");
                textSpan.textContent = afterText;
                if (task.completed) {
                    textSpan.style.textDecoration = "line-through";
                    textSpan.style.color = "var(--text-faint)";
                }
            }
        } else {
            // No tags found, just add the whole text
            const textSpan = textContainer.createEl("span");
            textSpan.textContent = taskText;
            if (task.completed) {
                textSpan.style.textDecoration = "line-through";
                textSpan.style.color = "var(--text-faint)";
            }
        }

        // Add priority markers (🔴, ⚠️, etc.)
        if (taskText.includes("⚠️") || taskText.includes("🔴") || taskText.includes("🚨")) {
            const marker = taskDiv.createEl("span", {cls: "priority-marker"});
            marker.textContent = "!";
            marker.style.color = "var(--text-error)";
            marker.style.marginLeft = "4px";
            marker.style.fontWeight = "bold";
        }
    });
}

// Create buttons for each tag with counts
sortedTags.forEach(tag => {
    const button = buttonsContainer.createEl("button", {
        cls: tag === activeTag ? "active-tag tag-button" : "tag-button"
    });

    // Format tag name with count
    const displayName = tag === "All" ? "All Tasks" : tag === "Untagged" ? "Untagged" : `#${tag}`;
    button.textContent = `${displayName}(${tagMap[tag].length})`;

    // Style the button
    button.style.padding = "4px 8px";
    button.style.borderRadius = "4px";
    button.style.border = "1px solid var(--interactive-accent)";
    button.style.backgroundColor = tag === activeTag ?
        "var(--interactive-accent)" : "var(--background-secondary)";
    button.style.color = tag === activeTag ?
        "var(--text-on-accent)" : "var(--text-normal)";
    button.style.cursor = "pointer";

    // Add click event
    button.addEventListener("click", () => {
        // Update active tag
        activeTag = tag;

        // Update button styles
        buttonsContainer.querySelectorAll("button").forEach(btn => {
            btn.style.backgroundColor = "var(--background-secondary)";
            btn.style.color = "var(--text-normal)";
        });
        button.style.backgroundColor = "var(--interactive-accent)";
        button.style.color = "var(--text-on-accent)";

        // Render tasks for this tag
        renderTasks(tag);
    });
});

// Create container for tasks
let tasksContainer = dv.el("div", "", {cls: "tasks-container"});

// Render initial tasks (All)
renderTasks(activeTag);

// Add CSS for styling
const styleEl = dv.el("style", `
.task-tag-buttons button:hover {
    opacity: 0.9;
}
.tasks-container {
    margin-top: 10px;
}
.task-item:hover {
    background-color: var(--background-modifier-hover);
}
.tag-button {
    white-space: nowrap;
}
`);