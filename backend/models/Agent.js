const mongoose = require('mongoose');

const AgentSchema = new mongoose.Schema({
  name: { type: String, required: true },
  location: {
    type: { type: String, default: 'Point' },
    coordinates: { type: [Number], index: '2dsphere' }
  },
  status: { type: String, enum: ['open', 'closed'], default: 'closed' },
  float: { type: Number, required: true },
  rating: { type: Number, default: 0 },
  reviews: [{ type: String }],
  updatedAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model('Agent', AgentSchema);
