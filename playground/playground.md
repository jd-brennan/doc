<!-- Space: ~6357f924b7b39379d71f6b22 -->
<!-- Title: JD's Playground -->

This is a paragraph.

## What good is sitting alone in your room?

| Document        |               |
| --------------- | ------------- |
| Status          | Draft         |
| Authors         | JD Brennan    |
| Reviewers       | Reuben Jacobs |
|                 | Nathan Louie  |

## Overview

Sequence Diagram

```mermaid
sequenceDiagram
    actor BS as Billing Specialist
    participant BO as Backoffice
    participant SG as Stargate
    participant PD as Patient Data Service
    participant RR as reqrepo
    participant NS as NSYNC
    participant SF as Salesforce
    participant XI as Xifin

    BS->>BO: FAP Data
    BS->>BO: Save
    BO->>SG: Save FAP Data
    SG->>PD: Save FAP Data
    SG->>+RR: Save FAP Discount
    RR->>RR: Calculate Discount
    RR->>-SG: Discount
    SG->>BO: Discount

    loop
        NS->>+RR: Check for new data
        RR->>-NS: FAP Data
        NS->>SF: FAP Data
    end
    SF->>XI: Apply discount

```

```mermaid
flowchart TD
    Kafka[Kafka Server] -- "RQ created/updated (Kafka msg)" --> ORSL
    ORSL["Kafka Listener"] --> Conductor
    Conductor <--> ORS["Order Routing Service"]
    ORS <--> OPS["Order Progression Service"]
    ORS <--> RR[ReqRepo]
    
    subgraph "Conductor"
        Start["RQ Review Complete"] --> Step1["Steps: ..."]
	    Step1 --> OOP["Create OOP Estimate"]
        Step1 --> OOC["Order is OOC"]
        Step1 --> LMN["Generate LMN"]
end
```
    participant RR as reqrepo
    participant ORS as "Order Routing Service"
    participant CAPI as "Conductor API"
    participant OPS as "Order Progression Service"
    RR->>ORS: RQ Modified Kafka Message


Backoffice API Routing

V1 - configuration that caused the incident

```mermaid
flowchart TD
    IC["Ingress
    Controller"]
    BOC(["BO
    Container"])
    BOSC["Side Car"]
    RRC(["RR
    Container"])
    RRSC["Side Car"]
    Browser -->|/bo| IC
    Browser -->|/bo/api| IC
    IC -->|"(1)"| BOC
    subgraph BO pod
    BOC -->|"(2)"| BOSC
    end
    BOSC -->|"/bo/api (1B)"| RRC
    subgraph RR pod
    RRC --> RRSC
    end
    BOSC -->|"(3)"| IC
    IC -->|"(4)"| RRC
    linkStyle 1,2,3,6,7 stroke:red,stroke-width:3px,color:red;

```

V2 - current

```mermaid
flowchart TD
    IC["Ingress
    Controller"]
    BOC(["BO
    Container"])
    BOSC["Side Car"]
    RRC(["RR
    Container"])
    RRSC["Side Car"]
    Browser -->|/bo| IC
    Browser -->|/bo/api| IC
    IC -->|"(1)"| BOC
    subgraph BO pod
    BOC -->|"(2)"| BOSC
    end
    BOSC -->|"(3)"| RRC
    subgraph RR pod
    RRC --> RRSC
    end
    BOSC --> IC
    IC --> RRC
    linkStyle 1,2,3,4 stroke:blue,stroke-width:3px,color:blue;

```

V3 - planned

```mermaid
flowchart TD
    IC["Ingress
    Controller"]
    BOC(["BO
    Container"])
    BOSC["Side Car"]
    RRC(["RR
    Container"])
    RRSC["Side Car"]
    Browser -->|/bo| IC
    Browser -->|/bo/api| IC
    IC --> BOSC
    IC -->|"(1)"| RRSC
    subgraph BO pod
    BOSC <--> BOC
    end
    subgraph RR pod
    RRSC <-->|"(2)"| RRC
    end
    BOSC <--> RRSC
    linkStyle 1,3,5 stroke:green,stroke-width:3px,color:green;

```

> I wonder how Confu handles block quotes This could be ugly.

1. First things first
2. Second changes are rare
3. Third time's the charm

<p>Hmmm. <ac:inline-comment-marker ac:ref="21eaddf5-d89b-4450-9eda-7486be4e42a7">Another paragraph</ac:inline-comment-marker>.</p>


Bullet list

 - Earth
 - Wind
 - Fire

And some `code`

---

[And try this link](https://example.com)

Thanks for playing!

## More stuff

And what do I have to say here?

