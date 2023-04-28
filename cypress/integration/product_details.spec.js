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

  it("Click on the first product and verify the product detail-details page opens", () => {
    cy.get(':nth-child(1) > a > img').click();
    cy.get('.product-detail').should("be.visible");
  });  
  
})
