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

```mermaid
flowchart TD
    RR[ReqRepo] -- "RQ review complete (Kafka msg)" --> ORSL
    ORSL["Kafka Listener"] --> Conductor
    Conductor <--> OPS["Order Progression Service"]
    Conductor <--> ORS["Order Routing Service"]
    subgraph "Conductor"
        Start["RQ Review Complete"] --> Step1["Steps: ..."]
	    Step1 --> OOP["Create OOP Estimate"]
        Step1 --> OOC["Order is OOC"]
        Step1 --> LMN["Generate LMN"]
end
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

