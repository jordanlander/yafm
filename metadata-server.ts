import express from 'express';
import path from 'path';

const app = express();
const PORT = process.env.PORT || 3000;

const metadataDir = path.join(__dirname, 'metadata');

app.use(express.static(metadataDir));

app.get('/', (_req, res) => {
  res.send('BadgeNFT metadata server');
});

app.listen(PORT, () => {
  console.log(`Metadata server listening on port ${PORT}`);
});
