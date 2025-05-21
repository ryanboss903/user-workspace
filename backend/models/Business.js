const mongoose = require('mongoose');

const BusinessSchema = new mongoose.Schema({
  name: { type: String, required: true },
  category: { type: String },
  location: {
    type: { type: String, default: 'Point' },
    coordinates: { type: [Number], index: '2dsphere' }
  },
  status: { type: String, enum: ['open', 'closed'], default: 'closed' },
  stock: { type: String },
  services: [{ type: String }],
  rating: { type: Number, default: 0 },
  reviews: [{ type: String }],
  contact: { type: String },
  createdAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model('Business', BusinessSchema);
