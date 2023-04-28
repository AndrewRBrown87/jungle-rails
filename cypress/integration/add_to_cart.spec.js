/// <reference types="cypress" />

describe('jungle app', () => {
  beforeEach(() => {
    cy.visit('/')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });  

  it("Click on the first add button and verify that the cart increases by one", () => {
    cy.get(':nth-child(1) > div > .button_to > .btn').click({force: true});
    cy.get('.end-0 > .nav-link').contains("My Cart (1)")
  });  
  
})
