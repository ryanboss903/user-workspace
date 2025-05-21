const express = require('express');
const app = express();
const path = require('path');
const fs = require('fs');

// Serve static HTML file
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'download.html'));
});

// Handle download
app.get('/download', (req, res) => {
    const file = path.join(__dirname, 'project.zip');
    
    // Check if file exists
    if (!fs.existsSync(file)) {
        return res.status(404).send('Project zip file not found. Please ensure the file has been created.');
    }

    res.download(file, 'project.zip', (err) => {
        if (err) {
            console.error('Download error:', err);
            res.status(500).send('Error downloading the file');
        }
    });
});

// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Something broke!');
});

app.listen(8000, () => {
    console.log('File server running on port 8000');
    console.log('Visit http://localhost:8000 to download the project');
});
