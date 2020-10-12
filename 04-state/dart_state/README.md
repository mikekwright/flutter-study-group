State Design Pattern
===========================================

This project demonstrates the state design pattern being implemented using
interfaces and class implementations.  It is a simple example that it used
to demonstrate the power of the state pattern.

## Problem Story

We have a new protocol for transfering that we need to handle reading, this protocol is defined
later in this document.  We want to avoid using to much branching logic because
of the performance issues that could come up.

### Protocol

Our protocol is a text based protocol that is broken into the following pieces:

* Header (Required)
* Attributes (Optional)
* Body (Optional)
* Footer (Required)

Each of these sections is slightly unique and are shown below.

#### Header

    HEADER <title>
    ORIGIN: <ipv4 address>
    DATE: <MM-DD-YYYY>

#### Attributes

    ATTR
    SENDER is <name>
    CONTENT is [json|xml|yaml] *
    RESPONSE REQUIRED is [true|false] *
    RESPONSE ADDRESS is <address> *

#### Body
    
    BODY <size in hex>
    <body contents of size>
    
#### Footer

    FOOTER
    <key> - <value>
    <key> - <value>

### Example

    HEADER Study group Message
    ORIGIN: 127.0.0.1
    DATE: 10-11-2020

    ATTR
    SENDER is Manual
    CONTENT is json
    RESPONSE REQUIRED is false

    BODY 11
    {"field":"value"}

    FOOTER
    Reason - Study Group
    Protocol - Whatever
