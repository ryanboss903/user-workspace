const Task = require('../models/Task');

exports.getTasks = async (req, res, next) => {
  try {
    const tasks = await Task.find();
    res.json(tasks);
  } catch (err) {
    next(err);
  }
};

exports.createTask = async (req, res, next) => {
  try {
    const task = new Task(req.body);
    await task.save();
    res.status(201).json(task);
  } catch (err) {
    next(err);
  }
};

exports.updateTask = async (req, res, next) => {
  try {
    const task = await Task.findByIdAndUpdate(req.params.id, req.body, { new: true });
    if (!task) return res.status(404).json({ message: 'Task not found' });
    res.json(task);
  } catch (err) {
    next(err);
  }
};

exports.bidOnTask = async (req, res, next) => {
  try {
    const task = await Task.findById(req.params.id);
    if (!task) return res.status(404).json({ message: 'Task not found' });
    task.bids.push({ user: req.body.user, amount: req.body.amount });
    await task.save();
    res.json(task);
  } catch (err) {
    next(err);
  }
};

exports.assignTask = async (req, res, next) => {
  try {
    const task = await Task.findByIdAndUpdate(req.params.id, { assignedTo: req.body.user, status: 'in_progress' }, { new: true });
    if (!task) return res.status(404).json({ message: 'Task not found' });
    res.json(task);
  } catch (err) {
    next(err);
  }
};

exports.completeTask = async (req, res, next) => {
  try {
    const task = await Task.findByIdAndUpdate(req.params.id, { status: 'completed' }, { new: true });
    if (!task) return res.status(404).json({ message: 'Task not found' });
    res.json(task);
  } catch (err) {
    next(err);
  }
};
