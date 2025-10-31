function rebuild --description 'Rebuild NinjaStrat website and deploy to GitHub Pages'
    echo "🚀 Starting rebuild process..."
    
    # Change to the project directory
    cd /Users/spencerduran/Code_Repos/ninjastrat_website
    
    # Run the build
    echo "📦 Building site..."
    npm run build
    
    # Check if build succeeded
    if test $status -ne 0
        echo "❌ Build failed! Aborting."
        return 1
    end
    
    # Copy to docs folder
    echo "📁 Copying to docs folder..."
    rm -rf docs/*
    cp -r out/* docs/
    touch docs/.nojekyll
    
    # Git operations
    echo "📝 Committing changes..."
    git add -A
    git commit -m "rebuild"
    
    # Push to remote
    echo "⬆️  Pushing to GitHub..."
    git push
    
    echo "✅ Rebuild complete!"
end