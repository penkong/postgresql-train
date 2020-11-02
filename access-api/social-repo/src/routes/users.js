const express = require('express');
const userRepo = require('../repos/user.repo')

const router = express.Router();

router.get('/users', async (req, res) => {
  const users = await userRepo.find();
  res.send(users);
});

router.get('/users/:id', async (req, res) => {
  const { id } = req.params
  const user = await userRepo.findById(id);
  if(user) {
    res.send(user)
  } else {
    res.sendStatus(404)
  }
});

router.post('/users', async (req, res) => {
  const {username,bio} = req.body;
  const user = await userRepo.insert(username,bio);
  res.send(user);
});

router.put('/users/:id', async (req, res) => {
  const {id } = req.params;
  const {username, bio} = req.body;
  const user = await userRepo.update(id, username, bio);
  if(user) {
    res.send(user);

  } else {
    res.sendStatus(404);
  }
});

router.delete('/users/:id', async (req, res) => {
  const {id} = req.params;
  const user = await userRepo.delete(id);
  if(user) res.send(user);
  else res.sendStatus(404);
});

module.exports = router;
