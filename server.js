// server.js
const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Serve the single index.html on root
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Optional health check used by Dokploy or probes
app.get('/health', (req, res) => {
  res.json({ status: 'ok' });
});

// Fallback 404 for anything else
app.use((req, res) => {
  res.status(404).send('Not found');
});

app.listen(PORT, () => {
  console.log(`Simple HTTP server listening on port ${PORT}`);
});
