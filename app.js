const express = require("express");
const shortid = require("shortid");   

const app = express();
app.use(express.json());

const urls = {};

app.post("/shorten", (req, res) => {
  const { longUrl } = req.body;

  const id = shortid.generate();
  urls[id] = longUrl;

  res.json({ shortUrl: `http://localhost:5000/${id}` });
});

app.get("/:id", (req, res) => {
  const longUrl = urls[req.params.id];

  if (longUrl) {
    res.redirect(longUrl);
  } else {
    res.status(404).send("Not found");
  }
});

app.listen(5000, () => console.log("Server running on port 5000"))