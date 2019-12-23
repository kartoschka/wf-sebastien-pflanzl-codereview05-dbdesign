Car Rental Database Specification Exercise
==========================================

Task: design a database schema for a car for a car rental company, taking into
account the processes of reservation, retrieval, return and additional payments.

The following physical entities are or may be involved:

  - a customer who orders a rental and pays for it
  - a driver who is associated with that customer, or is the customer himself
  - a branch/shop/location that has the ordered rental car prepared for retrieval
  - a clerk that conducts check-in and payment
  - a return shop
  - a clerk that conducts check-out and additional payments

There are a lot of little details to figure out about such a rental process, like:

  - do customer and driver have to be the same person?
  - what kind of identification is necessary? Passport, driving license,
    personalausweis, social security number...?
  - can you pay cash (upfront?)? If credit card only, does a reservation need to
    be associated with a card, or can you supply the card at the actual check-in
    event?
  - can you make reservations online only? Does an online user already have to
    have identified himself with the required documents?
  - does a customer order a specific car, or does he order a type/class/model
    (or maybe a feature set, like number of seats/ps range/storage room...?)?
  - do you have to check out at the same branch as where you checked in? Do you
    have to register a specific check-out point beforehand?
  - ...

Without any specifications, we have to make various assumptions about the
process. For simplicity I will assume that the customer who rents a car must be
a driver, too. Reservations do not need proof of identity or licence, only the
usual customer registration info like name, address...  Reservations are for
specific objects made available at the customer's choice of company branch.
Customers may or may not be associated with one website user (but every website
user belongs to a customer), so customer registration and reservation can be
completely offline, too. There is no penalty for not following through with
a reservation (not showing up to get the car).

At check-in, adjustments may be made to the reservation (the requested object
might not be available, customer wants to have a flexible plan (higher fee),
etc.) Moving on, customer and clerk are required to make a short visual
inspection of the object and agree on its condition (an object has a free-text
description of its condition). No rental can be closed if renter and clerk do
not agree on the condition. The customer needs to supply his passport and
driving licence (copies are made and stored). Identity documents are associated
with a single check-in/renting event only; they are not to be stored with the
core customer data, or to be reused for later events. In the end, the customer
pays the sum agreed-on at reservation or adjustment (payment is always
immediately upfront and can be cash or card) and is handed keys and papers.

He then returns the car at or before the due date (which has also been
determined at reservation (or maybe adjusted at check-in)). If he returns too
late, there's a fee. If he returns earlier, he might get money back, if he used
a flexible booking plan.  He can return at any of the company branches. On
return, customer and clerk check the car's condition and agree on it. If
anything has changed from before rental, the changes are recorded and additional
fees will have to be paid after determining the value. If customer and clerk
have a disagreement on pre/post-rental condition etc., then a conflict needs to
be registered and handled further down the line.

In the following list I will try to extract the table-relation entities that
need to be populated in the described process:

  - customer: first name, last name, street address, town, postal code,
    country
  - user: username, password, email, customer id
  - car object: model id, color, condition description, location
  - car model: ...properties describing a car model...
  - shop: street address, town, postal code, country
  - employee: first name, last name, ...
  - reservation: from-date, to-date, flexible return (yes or no), fee, customer id,
    object id, shop id
  - check-in: reservation id, employee id, passport number, licence number
  - check-out: date, check-in id, shop id, employee id
  - issue: check-out id, description, fee, state (contested, agreed, paid, retracted)

Here are some more detailed text descriptions of the role of each table:

  - customer: a bag of unverified data that a customer supplies either on making
    an online user account or a offline reservation in a shop.

  - user: an identity that can log in and make reservation at the website.
    1-1 relation with a customer instance because customer info must be supplied
    at user registration. A customer might not have an associated user if the
    reservation process was done offline. A web user needs to have a unique
    email and username.

  - car model: some data describing a type of model that the rental company may
    or may not have actual physical instances of.

  - car object: an actual instance of a car model. A reservation needs to have
    one of this. The current location of the object should be registered here.

  - shop: a place where you can rent a car/make a reservation/pickup
    a car/return a car.

  - employee: someone working at a shop who can carry out
    a reservation/checkin/checkout business process

  - reservation: an abstract object holding the data necessary to begin
    a rental. A reservation holds the potential of a rental with its properties
    (like which object, the fee, etc.) which can then be made actual by
    instantiating a check-in. If the customer doesn't appear on reservation
    start date, it should simply be regarded as invalid and the object should be
    available for other renters (if the customer appears at a later date and the
    object is still available you could adjust reservation date and fee).

  - check-in: represents the event of a customer coming into the shop to get the
    car that was ordered. Depends on the existence of a reservation. The ID
    primary key of check-in has a foreign key relationship to the ID of
    a reservation - the ID of its parent reservation is reused.

  - check-out: represents the event of a customer coming into a shop to return
    a car. Depends on the existence of a check-in. A check-out has a check-in id
    foreign key as its primary key and reuses the ID of its parent check-in
    (which in turn reuses a reservation ID). This enforces the existence of
    a reservation for the existence of a check-in, the existence of a check-in
    for the existence of a check-out, and the uniqueness of check-in and
    check-out.

  - issue: if there are damages on/in the car object at check-out, which don't
    seem to be covered by the condition-description of that object, the employee
    responsible for that check-out needs to register an issue for each thing. An
    issue will be assigned a fee in some way and in the end the customer will
    get a packet of issues/fees to pay (or something like that). An issue has
    a state depending on whether the customer agrees or not etc. A check-out can
    only be considered fully complete if all associated issues have a completed
    state (like paid or retracted).
