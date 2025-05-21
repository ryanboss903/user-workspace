const express = require('express');
const router = express.Router();
const {
  getTasks,
  createTask,
  updateTask,
  bidOnTask,
  assignTask,
  completeTask
} = require('../controllers/taskController');

router.get('/', getTasks);
router.post('/', createTask);
router.put('/:id', updateTask);
router.post('/:id/bid', bidOnTask);
router.post('/:id/assign', assignTask);
router.post('/:id/complete', completeTask);

module.exports = router;
