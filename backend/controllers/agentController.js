const Agent = require('../models/Agent');

exports.getAgents = async (req, res, next) => {
  try {
    const { lat, lng, radius } = req.query;
    // Query agents using the 2dsphere index (with float forecasting in future enhancements)
    const agents = await Agent.find({
      location: {
        $near: {
          $geometry: { type: "Point", coordinates: [parseFloat(lng), parseFloat(lat)] },
          $maxDistance: parseInt(radius) || 5000
        }
      }
    });
    res.json(agents);
  } catch (err) {
    next(err);
  }
};

exports.agentFloatSwap = async (req, res, next) => {
  try {
    // Implement logic to process agent float swap
    res.json({ message: "Float swap processed" });
  } catch (err) {
    next(err);
  }
};

exports.updateAgentStatus = async (req, res, next) => {
  try {
    // Update agent status (open/closed) and other details
    res.json({ message: "Status updated" });
  } catch (err) {
    next(err);
  }
};
