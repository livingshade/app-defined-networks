-- Logging

/* 
Internal state: 
    rpc_events: A table to store rpc events
*/
CREATE TABLE rpc_events (
  timestamp TIMESTAMP,
  event_type VARCHAR(50),
  source VARCHAR(50),
  destination VARCHAR(50),
  rpc VARCHAR(50)
);


/*
  Processing Logic:
  1. Insert an event for each RPC
  2. Forward all RPCs
*/
INSERT INTO rpc_events (timestamp, type, source, destination, rpc) 
SELECT CURRENT_TIMESTAMP, event_type, src, dst, rpc
FROM input;

CREATE TABLE output AS
SELECT * from input; 