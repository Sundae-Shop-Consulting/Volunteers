import { LightningElement, api, wire } from 'lwc';
import { gql, graphql } from 'lightning/uiGraphQLApi';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from "lightning/pageReferenceUtils";

export default class BccEmailVolunteersAction extends NavigationMixin(LightningElement) {
    @api
    recordId;

    volunteerEmails;

    get variables() {
        return {
            volunteerShiftId: this.recordId,
        }
    }

    @wire(graphql, {
        query: gql`
          query assignedVolunteers($volunteerShiftId: ID!) {
            uiapi {
              query {
                VolunteerShiftAssignment__c(where: {VolunteerShift__c: {eq: $volunteerShiftId}}) {
                  edges {
                    node {
                      VolunteerContact__r {
                        Email {
                          value
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        `,
        variables: "$variables"
    })
    wiredGraphqlResult(result) {
        if (result.data) {
            this.volunteerEmails = result.data.uiapi.query.VolunteerShiftAssignment__c.edges.map(
                (edge) => edge.node.VolunteerContact__r.Email.value
            );
            this.navigateToSendEmailAction();
        }
    }

    invoked = false;

    @api
    invoke() {
        this.invoked = true;
        this.navigateToSendEmailAction();
    }

    navigateToSendEmailAction() {
        if (this.invoked && Array.isArray(this.volunteerEmails)) {
            // @todo show error if no emails
            this[NavigationMixin.Navigate]({
                type: "standard__quickAction",
                attributes: {
                    apiName: "Global.SendEmail",
                },
                state: {
                    recordId: this.recordId,
                    defaultFieldValues: encodeDefaultFieldValues({
                        BccAddress: this.volunteerEmails.join(',')
                    }),
                },
            });
        }
    }
}
