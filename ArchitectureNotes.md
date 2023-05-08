# Architecture Notes

Architectures should be evaluated by their

- failure modes
- scalability
- observability

API Call

- Failure modes
  - Network failure
  - Single Service failure can cascade to other services
- Scalability
  - Adding more service capacity requires a load balancer with multiple services
- Observability
  - Debugging may require checking stats or logs from multiple services to find a root cause

Message Queuing

- Failure modes
  - Intermittent network failure resistance since messages are queued
  - More resilient to single service failure. The service can process its queue after restart
  - Message service is single point of failure
  - Messages could get lost
  - Messages could get delivered twice
- Scalability
  - Can easily add more services to read messages off queue
  - Limited by scalability of message service
- Observability
  - Can monitor message queue length
  - Can monitor how many messages per unit time are processed by the services

Reconciliation

- Failure modes
  - Database is single point of failure
  - Missing database constraints or transactions boundaries can allow corrupt data
  - Can't have lost messages
  - Can't have messages delivered more than once
- Scalability
  - Limited by scalability of database
  - Can easily add more services to handle more widget requests
- Observability
  - Can easily measure the state of a widget request (it's in the database)