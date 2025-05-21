const axios = require('axios');

// Example: Initiate Payment via M-Pesa Daraja API
exports.initiateMpesaPayment = async (paymentData) => {
  try {
    const response = await axios.post(process.env.MPESA_API_URL, paymentData, {
      headers: {
        // Add authentication headers here
      }
    });
    return response.data;
  } catch (error) {
    throw new Error("M-Pesa payment failed: " + error.message);
  }
};

// Add similar functions for Airtel Money API integration as needed
