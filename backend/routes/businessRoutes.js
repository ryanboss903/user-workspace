const express = require('express');
const router = express.Router();
const {
  getBusinesses,
  createBusiness,
  updateBusiness,
  deleteBusiness
} = require('../controllers/businessController');

router.get('/', getBusinesses);
router.post('/', createBusiness);
router.put('/:id', updateBusiness);
router.delete('/:id', deleteBusiness);

module.exports = router;
