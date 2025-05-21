const express = require('express');
const router = express.Router();
const {
    getAgents,
    updateAgentStatus,
    agentFloatSwap
} = require('../controllers/agentController');

router.get('/', getAgents);  // Query agents by location, etc.
router.post('/swap', agentFloatSwap); // Process float swap requests
router.put('/:id/status', updateAgentStatus); // Update agent status

module.exports = router;
