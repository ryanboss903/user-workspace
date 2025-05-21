const Business = require('../models/Business');

exports.getBusinesses = async (req, res, next) => {
  try {
    const businesses = await Business.find();
    res.json(businesses);
  } catch (err) {
    next(err);
  }
};

exports.createBusiness = async (req, res, next) => {
  try {
    const business = new Business(req.body);
    await business.save();
    res.status(201).json(business);
  } catch (err) {
    next(err);
  }
};

exports.updateBusiness = async (req, res, next) => {
  try {
    const business = await Business.findByIdAndUpdate(req.params.id, req.body, { new: true });
    if (!business) return res.status(404).json({ message: 'Business not found' });
    res.json(business);
  } catch (err) {
    next(err);
  }
};

exports.deleteBusiness = async (req, res, next) => {
  try {
    const business = await Business.findByIdAndDelete(req.params.id);
    if (!business) return res.status(404).json({ message: 'Business not found' });
    res.json({ message: 'Business deleted' });
  } catch (err) {
    next(err);
  }
};
