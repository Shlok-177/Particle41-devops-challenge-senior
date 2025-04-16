const express = require('express');
const os = require('os');

const app = express();
const port = process.env.PORT || 8080;

// Normalize that Ip Address
function normalizeIp(ip) {
    // Handle x-forwarded-for lists (in case behind a proxy)
    if (ip.includes(',')) {
      ip = ip.split(',')[0];
    }
  
    // Remove IPv6 prefix if it's an IPv4-mapped address
    if (ip.startsWith('::ffff:')) {
      return ip.replace('::ffff:', '');
    }
  
    return ip;
  }

// Get Client IP address 
function getClientIp(req) {
    const rawIp = req.headers['x-forwarded-for'] || req.socket.remoteAddress || '';
    return normalizeIp(rawIp);
  }

app.get('/', (req, res) => {
  const response = {
    timestamp: new Date().toISOString(),
    ip: getClientIp(req)
  };
  res.json(response);
});

app.listen(port, () => {
  console.log(`SimpleTimeService listening at http://localhost:${port}`);
});
