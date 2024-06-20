BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES('Account-1','Sample Account for Entitlements','');
INSERT INTO "Account" VALUES('Account-2','Sample Account for Entitlements','');
INSERT INTO "Account" VALUES('Account-3','Sample Account for Entitlements','');
INSERT INTO "Account" VALUES('Account-4','Doe Household','');
INSERT INTO "Account" VALUES('Account-5','Harris Household','');
INSERT INTO "Account" VALUES('Account-6','Young Household','');
INSERT INTO "Account" VALUES('Account-7','Wright Household','');
INSERT INTO "Account" VALUES('Account-8','Scott Household','');
INSERT INTO "Account" VALUES('Account-9','Lewis Household','');
INSERT INTO "Account" VALUES('Account-10','Walker Household','');
INSERT INTO "Account" VALUES('Account-11','Harris Household','');
INSERT INTO "Account" VALUES('Account-12','Wilson Household','');
INSERT INTO "Account" VALUES('Account-13','Scott Household','');
INSERT INTO "Account" VALUES('Account-14','Smith Household','');
INSERT INTO "Account" VALUES('Account-15','Davis Household','');
INSERT INTO "Account" VALUES('Account-16','Jackson Household','');
INSERT INTO "Account" VALUES('Account-17','Wilson Household','');
INSERT INTO "Account" VALUES('Account-18','Robinson Household','');
INSERT INTO "Account" VALUES('Account-19','Jackson Household','');
INSERT INTO "Account" VALUES('Account-20','Wright Household','');
INSERT INTO "Account" VALUES('Account-21','Harris Household','');
INSERT INTO "Account" VALUES('Account-22','Young Household','');
INSERT INTO "Account" VALUES('Account-23','Hall Household','');
INSERT INTO "Account" VALUES('Account-24','Hall Household','');
INSERT INTO "Account" VALUES('Account-25','Allen Household','');
INSERT INTO "Account" VALUES('Account-26','Scott Household','');
INSERT INTO "Account" VALUES('Account-27','Wright Household','');
INSERT INTO "Account" VALUES('Account-28','Hall Household','');
INSERT INTO "Account" VALUES('Account-29','Anderson Household','');
INSERT INTO "Account" VALUES('Account-30','Robinson Household','');
INSERT INTO "Account" VALUES('Account-31','Davis Household','');
INSERT INTO "Account" VALUES('Account-32','Wilson Household','');
INSERT INTO "Account" VALUES('Account-33','Hall Household','');
INSERT INTO "Account" VALUES('Account-34','Walker Household','');
INSERT INTO "Account" VALUES('Account-35','Martinez Household','');
INSERT INTO "Account" VALUES('Account-36','Anderson Household','');
INSERT INTO "Account" VALUES('Account-37','Allen Household','');
INSERT INTO "Account" VALUES('Account-38','Hall Household','');
INSERT INTO "Account" VALUES('Account-39','Harris Household','');
INSERT INTO "Account" VALUES('Account-40','Davis Household','');
INSERT INTO "Account" VALUES('Account-41','Clark Household','');
INSERT INTO "Account" VALUES('Account-42','Robinson Household','');
INSERT INTO "Account" VALUES('Account-43','Davis Household','');
INSERT INTO "Account" VALUES('Account-44','Scott Household','');
INSERT INTO "Account" VALUES('Account-45','King Household','');
INSERT INTO "Account" VALUES('Account-46','Jackson Household','');
INSERT INTO "Account" VALUES('Account-47','Harris Household','');
INSERT INTO "Account" VALUES('Account-48','Walker Household','');
INSERT INTO "Account" VALUES('Account-49','King Household','');
INSERT INTO "Account" VALUES('Account-50','Wright Household','');
INSERT INTO "Account" VALUES('Account-51','Brown Household','');
INSERT INTO "Account" VALUES('Account-52','Allen Household','');
INSERT INTO "Account" VALUES('Account-53','Harris Household','');
INSERT INTO "Account" VALUES('Account-54','King Household','');
INSERT INTO "Account" VALUES('Account-55','Scott Household','');
INSERT INTO "Account" VALUES('Account-56','Wright Household','');
INSERT INTO "Account" VALUES('Account-57','Scott Household','');
INSERT INTO "Account" VALUES('Account-58','Scott Household','');
INSERT INTO "Account" VALUES('Account-59','Brown Household','');
INSERT INTO "Account" VALUES('Account-60','Jackson Household','');
INSERT INTO "Account" VALUES('Account-61','King Household','');
INSERT INTO "Account" VALUES('Account-62','Doe Household','');
INSERT INTO "Account" VALUES('Account-63','Wright Household','');
INSERT INTO "Account" VALUES('Account-64','Clark Household','');
INSERT INTO "Account" VALUES('Account-65','King Household','');
INSERT INTO "Account" VALUES('Account-66','Allen Household','');
INSERT INTO "Account" VALUES('Account-67','Wright Household','');
INSERT INTO "Account" VALUES('Account-68','Anderson Household','');
INSERT INTO "Account" VALUES('Account-69','Clark Household','');
INSERT INTO "Account" VALUES('Account-70','Allen Household','');
INSERT INTO "Account" VALUES('Account-71','Harris Household','');
INSERT INTO "Account" VALUES('Account-72','Wilson Household','');
INSERT INTO "Account" VALUES('Account-73','Anderson Household','');
INSERT INTO "Account" VALUES('Account-74','Robinson Household','');
INSERT INTO "Account" VALUES('Account-75','Wright Household','');
INSERT INTO "Account" VALUES('Account-76','Jackson Household','');
INSERT INTO "Account" VALUES('Account-77','Robinson Household','');
INSERT INTO "Account" VALUES('Account-78','Brown Household','');
INSERT INTO "Account" VALUES('Account-79','Wilson Household','');
INSERT INTO "Account" VALUES('Account-80','Thomas Household','');
INSERT INTO "Account" VALUES('Account-81','Anderson Household','');
INSERT INTO "Account" VALUES('Account-82','Jackson Household','');
INSERT INTO "Account" VALUES('Account-83','Thomas Household','');
INSERT INTO "Account" VALUES('Account-84','King Household','');
INSERT INTO "Account" VALUES('Account-85','Thomas Household','');
INSERT INTO "Account" VALUES('Account-86','Wright Household','');
INSERT INTO "Account" VALUES('Account-87','Wilson Household','');
INSERT INTO "Account" VALUES('Account-88','King Household','');
INSERT INTO "Account" VALUES('Account-89','Doe Household','');
INSERT INTO "Account" VALUES('Account-90','Robinson Household','');
INSERT INTO "Account" VALUES('Account-91','Clark Household','');
INSERT INTO "Account" VALUES('Account-92','Allen Household','');
INSERT INTO "Account" VALUES('Account-93','Davis Household','');
INSERT INTO "Account" VALUES('Account-94','Clark Household','');
INSERT INTO "Account" VALUES('Account-95','Young Household','');
INSERT INTO "Account" VALUES('Account-96','Smith Household','');
INSERT INTO "Account" VALUES('Account-97','Jackson Household','');
INSERT INTO "Account" VALUES('Account-98','Clark Household','');
INSERT INTO "Account" VALUES('Account-99','Brown Household','');
INSERT INTO "Account" VALUES('Account-100','Jackson Household','');
INSERT INTO "Account" VALUES('Account-101','Davis Household','');
INSERT INTO "Account" VALUES('Account-102','Scott Household','');
INSERT INTO "Account" VALUES('Account-103','Anderson Household','');
CREATE TABLE "Address" (
	id VARCHAR(255) NOT NULL, 
	"Description" VARCHAR(255), 
	"Street" VARCHAR(255), 
	"City" VARCHAR(255), 
	"State" VARCHAR(255), 
	"PostalCode" VARCHAR(255), 
	"Country" VARCHAR(255), 
	"DrivingDirections" VARCHAR(255), 
	"Timezone" VARCHAR(255), 
	"LocationType" VARCHAR(255), 
	"AddressType" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Address" VALUES('Address-1','','555 Rosebud Lane','Kirkland','WA','98004','','','','Site','Mailing');
CREATE TABLE "Contact" (
	id VARCHAR(255) NOT NULL, 
	"DoNotCall" VARCHAR(255), 
	"FirstName" VARCHAR(255), 
	"HasOptedOutOfEmail" VARCHAR(255), 
	"HasOptedOutOfFax" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"ReportsToId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Contact" VALUES('Contact-1','False','Charlotte','False','False','Harris','Account-11','');
INSERT INTO "Contact" VALUES('Contact-2','False','James','False','False','Davis','Account-101','');
INSERT INTO "Contact" VALUES('Contact-3','False','Charlotte','False','False','Scott','Account-102','');
INSERT INTO "Contact" VALUES('Contact-4','False','Ava','False','False','Anderson','Account-103','');
INSERT INTO "Contact" VALUES('Contact-5','False','Ava','False','False','Wilson','Account-12','');
INSERT INTO "Contact" VALUES('Contact-6','False','Andrew','False','False','Scott','Account-13','');
INSERT INTO "Contact" VALUES('Contact-7','False','Laura','False','False','Smith','Account-14','');
INSERT INTO "Contact" VALUES('Contact-8','False','Mia','False','False','Davis','Account-15','');
INSERT INTO "Contact" VALUES('Contact-9','False','Daniel','False','False','Jackson','Account-16','');
INSERT INTO "Contact" VALUES('Contact-10','False','John','False','False','Wilson','Account-17','');
INSERT INTO "Contact" VALUES('Contact-11','False','Mia','False','False','Robinson','Account-18','');
INSERT INTO "Contact" VALUES('Contact-12','False','Sarah','False','False','Jackson','Account-19','');
INSERT INTO "Contact" VALUES('Contact-13','False','Michael','False','False','Wright','Account-20','');
INSERT INTO "Contact" VALUES('Contact-14','False','Samuel','False','False','Harris','Account-21','');
INSERT INTO "Contact" VALUES('Contact-15','False','Laura','False','False','Young','Account-22','');
INSERT INTO "Contact" VALUES('Contact-16','False','Matthew','False','False','Hall','Account-23','');
INSERT INTO "Contact" VALUES('Contact-17','False','Daniel','False','False','Hall','Account-24','');
INSERT INTO "Contact" VALUES('Contact-18','False','Andrew','False','False','Allen','Account-25','');
INSERT INTO "Contact" VALUES('Contact-19','False','Michael','False','False','Scott','Account-26','');
INSERT INTO "Contact" VALUES('Contact-20','False','Ava','False','False','Wright','Account-27','');
INSERT INTO "Contact" VALUES('Contact-21','False','James','False','False','Hall','Account-28','');
INSERT INTO "Contact" VALUES('Contact-22','False','John','False','False','Anderson','Account-29','');
INSERT INTO "Contact" VALUES('Contact-23','False','Isabella','False','False','Robinson','Account-30','');
INSERT INTO "Contact" VALUES('Contact-24','False','David','False','False','Doe','Account-4','');
INSERT INTO "Contact" VALUES('Contact-25','False','Isabella','False','False','Davis','Account-31','');
INSERT INTO "Contact" VALUES('Contact-26','False','Andrew','False','False','Wilson','Account-32','');
INSERT INTO "Contact" VALUES('Contact-27','False','Laura','False','False','Hall','Account-33','');
INSERT INTO "Contact" VALUES('Contact-28','False','Chris','False','False','Walker','Account-34','');
INSERT INTO "Contact" VALUES('Contact-29','False','Michael','False','False','Martinez','Account-35','');
INSERT INTO "Contact" VALUES('Contact-30','False','John','False','False','Anderson','Account-36','');
INSERT INTO "Contact" VALUES('Contact-31','False','Andrew','False','False','Allen','Account-37','');
INSERT INTO "Contact" VALUES('Contact-32','False','Jane','False','False','Hall','Account-38','');
INSERT INTO "Contact" VALUES('Contact-33','False','David','False','False','Harris','Account-39','');
INSERT INTO "Contact" VALUES('Contact-34','False','Samuel','False','False','Harris','Account-5','');
INSERT INTO "Contact" VALUES('Contact-35','False','Daniel','False','False','Clark','Account-41','');
INSERT INTO "Contact" VALUES('Contact-36','False','Olivia','False','False','Robinson','Account-42','');
INSERT INTO "Contact" VALUES('Contact-37','False','Daniel','False','False','Davis','Account-43','');
INSERT INTO "Contact" VALUES('Contact-38','False','Emily','False','False','Scott','Account-44','');
INSERT INTO "Contact" VALUES('Contact-39','False','Matthew','False','False','King','Account-45','');
INSERT INTO "Contact" VALUES('Contact-40','False','David','False','False','Jackson','Account-46','');
INSERT INTO "Contact" VALUES('Contact-41','False','Michael','False','False','Harris','Account-47','');
INSERT INTO "Contact" VALUES('Contact-42','False','Daniel','False','False','Walker','Account-48','');
INSERT INTO "Contact" VALUES('Contact-43','False','Samuel','False','False','King','Account-49','');
INSERT INTO "Contact" VALUES('Contact-44','False','Mia','False','False','Wright','Account-50','');
INSERT INTO "Contact" VALUES('Contact-45','False','Laura','False','False','Young','Account-6','');
INSERT INTO "Contact" VALUES('Contact-46','False','James','False','False','Brown','Account-51','');
INSERT INTO "Contact" VALUES('Contact-47','False','Daniel','False','False','Allen','Account-52','');
INSERT INTO "Contact" VALUES('Contact-48','False','Sophia','False','False','Harris','Account-53','');
INSERT INTO "Contact" VALUES('Contact-49','False','Daniel','False','False','King','Account-54','');
INSERT INTO "Contact" VALUES('Contact-50','False','David','False','False','Scott','Account-55','');
INSERT INTO "Contact" VALUES('Contact-51','False','Michael','False','False','Wright','Account-56','');
INSERT INTO "Contact" VALUES('Contact-52','False','Chris','False','False','Scott','Account-57','');
INSERT INTO "Contact" VALUES('Contact-53','False','Joseph','False','False','Scott','Account-58','');
INSERT INTO "Contact" VALUES('Contact-54','False','Sarah','False','False','Brown','Account-59','');
INSERT INTO "Contact" VALUES('Contact-55','False','Chris','False','False','Jackson','Account-60','');
INSERT INTO "Contact" VALUES('Contact-56','False','Andrew','False','False','Wright','Account-7','');
INSERT INTO "Contact" VALUES('Contact-57','False','Ava','False','False','King','Account-61','');
INSERT INTO "Contact" VALUES('Contact-58','False','Andrew','False','False','Doe','Account-62','');
INSERT INTO "Contact" VALUES('Contact-59','False','Laura','False','False','Wright','Account-63','');
INSERT INTO "Contact" VALUES('Contact-60','False','Sophia','False','False','Clark','Account-64','');
INSERT INTO "Contact" VALUES('Contact-61','False','Andrew','False','False','King','Account-65','');
INSERT INTO "Contact" VALUES('Contact-62','False','Laura','False','False','Allen','Account-66','');
INSERT INTO "Contact" VALUES('Contact-63','False','Chris','False','False','Wright','Account-67','');
INSERT INTO "Contact" VALUES('Contact-64','False','Emily','False','False','Anderson','Account-68','');
INSERT INTO "Contact" VALUES('Contact-65','False','Matthew','False','False','Clark','Account-69','');
INSERT INTO "Contact" VALUES('Contact-66','False','Mia','False','False','Allen','Account-70','');
INSERT INTO "Contact" VALUES('Contact-67','False','Ava','False','False','Scott','Account-8','');
INSERT INTO "Contact" VALUES('Contact-68','False','Charlotte','False','False','Harris','Account-71','');
INSERT INTO "Contact" VALUES('Contact-69','False','Charlotte','False','False','Wilson','Account-72','');
INSERT INTO "Contact" VALUES('Contact-70','False','Jane','False','False','Anderson','Account-73','');
INSERT INTO "Contact" VALUES('Contact-71','False','Olivia','False','False','Robinson','Account-74','');
INSERT INTO "Contact" VALUES('Contact-72','False','David','False','False','Wright','Account-75','');
INSERT INTO "Contact" VALUES('Contact-73','False','Chris','False','False','Jackson','Account-76','');
INSERT INTO "Contact" VALUES('Contact-74','False','Matthew','False','False','Robinson','Account-77','');
INSERT INTO "Contact" VALUES('Contact-75','False','Jane','False','False','Brown','Account-78','');
INSERT INTO "Contact" VALUES('Contact-76','False','Mia','False','False','Wilson','Account-79','');
INSERT INTO "Contact" VALUES('Contact-77','False','Samuel','False','False','Thomas','Account-80','');
INSERT INTO "Contact" VALUES('Contact-78','False','Olivia','False','False','Lewis','Account-9','');
INSERT INTO "Contact" VALUES('Contact-79','False','Laura','False','False','Anderson','Account-81','');
INSERT INTO "Contact" VALUES('Contact-80','False','John','False','False','Jackson','Account-82','');
INSERT INTO "Contact" VALUES('Contact-81','False','Daniel','False','False','Thomas','Account-83','');
INSERT INTO "Contact" VALUES('Contact-82','False','Isabella','False','False','King','Account-84','');
INSERT INTO "Contact" VALUES('Contact-83','False','Andrew','False','False','Thomas','Account-85','');
INSERT INTO "Contact" VALUES('Contact-84','False','Olivia','False','False','Wright','Account-86','');
INSERT INTO "Contact" VALUES('Contact-85','False','James','False','False','Wilson','Account-87','');
INSERT INTO "Contact" VALUES('Contact-86','False','Emily','False','False','King','Account-88','');
INSERT INTO "Contact" VALUES('Contact-87','False','Samuel','False','False','Doe','Account-89','');
INSERT INTO "Contact" VALUES('Contact-88','False','Matthew','False','False','Robinson','Account-90','');
INSERT INTO "Contact" VALUES('Contact-89','False','Emily','False','False','Walker','Account-10','');
INSERT INTO "Contact" VALUES('Contact-90','False','Emily','False','False','Clark','Account-91','');
INSERT INTO "Contact" VALUES('Contact-91','False','Ava','False','False','Allen','Account-92','');
INSERT INTO "Contact" VALUES('Contact-92','False','Isabella','False','False','Davis','Account-93','');
INSERT INTO "Contact" VALUES('Contact-93','False','Sophia','False','False','Clark','Account-94','');
INSERT INTO "Contact" VALUES('Contact-94','False','Emily','False','False','Young','Account-95','');
INSERT INTO "Contact" VALUES('Contact-95','False','Ava','False','False','Smith','Account-96','');
INSERT INTO "Contact" VALUES('Contact-96','False','Andrew','False','False','Jackson','Account-97','');
INSERT INTO "Contact" VALUES('Contact-97','False','Samuel','False','False','Clark','Account-98','');
INSERT INTO "Contact" VALUES('Contact-98','False','Sophia','False','False','Brown','Account-99','');
INSERT INTO "Contact" VALUES('Contact-99','False','Laura','False','False','Jackson','Account-100','');
CREATE TABLE "Location" (
	id VARCHAR(255) NOT NULL, 
	"IsInventoryLocation" VARCHAR(255), 
	"IsMobile" VARCHAR(255), 
	"LocationType" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"ShouldSyncWithOci" VARCHAR(255), 
	"VisitorAddressId" VARCHAR(255), 
	"ParentLocationId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Location" VALUES('Location-1','False','False','Site','Toe Beans Animal Rescue - Main Office','False','','');
INSERT INTO "Location" VALUES('Location-2','False','False','Site','Toe Beans Cat Shelter - Shoreline','False','','');
INSERT INTO "Location" VALUES('Location-3','False','False','Site','Toe Beans Dog Shelter - Kirkland','False','Address-1','');
CREATE TABLE "VolunteerActivityAssignment__c" (
	id VARCHAR(255) NOT NULL, 
	"VolunteerAccount__c" VARCHAR(255), 
	"VolunteerActivity__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerActivityAssignment__c" VALUES('VolunteerActivityAssignment__c-1','','VolunteerActivity__c-2','Contact-8');
INSERT INTO "VolunteerActivityAssignment__c" VALUES('VolunteerActivityAssignment__c-2','','VolunteerActivity__c-1','Contact-8');
CREATE TABLE "VolunteerActivity__c" (
	id VARCHAR(255) NOT NULL, 
	"Description__c" VARCHAR(255), 
	"MaximumVolunteersAllowed__c" VARCHAR(255), 
	"MinimumVolunteersNeeded__c" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"VolunteersAssigned__c" VARCHAR(255), 
	"Location__c" VARCHAR(255), 
	"VolunteerEvent__c" VARCHAR(255), 
	"VolunteerPosition__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerActivity__c" VALUES('VolunteerActivity__c-1','Ongoing activity for data-entry related tasks. Input and manage vital information regarding shelter animals, adoptions, donations, and volunteers.','5.0','1.0','Data Entry','1.0','Location-1','','VolunteerPosition__c-1');
INSERT INTO "VolunteerActivity__c" VALUES('VolunteerActivity__c-2','Join us Thursdays at 2 p.m. to clean litter boxes, change food and water, and cuddle with kittens.','5.0','2.0','Cat Care - Thursday Afternoons','1.0','Location-2','','VolunteerPosition__c-2');
CREATE TABLE "VolunteerEvent__c" (
	id VARCHAR(255) NOT NULL, 
	"Description__c" VARCHAR(255), 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "VolunteerHoursLog__c" (
	id VARCHAR(255) NOT NULL, 
	"Comments__c" VARCHAR(255), 
	"EndDateTime__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"Hours__c" VARCHAR(255), 
	"PlannedStartDateTime__c" VARCHAR(255), 
	"StartDateTime__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
	"VolunteerShift__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "VolunteerPositionAssignment__c" (
	id VARCHAR(255) NOT NULL, 
	"VolunteerAccount__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
	"VolunteerPosition__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerPositionAssignment__c" VALUES('VolunteerPositionAssignment__c-1','','Contact-8','VolunteerPosition__c-1');
INSERT INTO "VolunteerPositionAssignment__c" VALUES('VolunteerPositionAssignment__c-2','','Contact-8','VolunteerPosition__c-2');
CREATE TABLE "VolunteerPosition__c" (
	id VARCHAR(255) NOT NULL, 
	"Description__c" VARCHAR(255), 
	"Duties__c" VARCHAR(255), 
	"MinimumAge__c" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"Qualifications__c" VARCHAR(255), 
	"RequiredTraining__c" VARCHAR(255), 
	"Status__c" VARCHAR(255), 
	"TimeCommitment__c" VARCHAR(255), 
	"Location__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-1','<p>Administrative assistants at Toe Beans Animal Shelter will input and manage vital information regarding shelter animals, adoptions, donations, and volunteers to ensure accurate and up-to-date records that support the shelter’s operations and outreach efforts.</p>','<p>Administrative assistants will be responsible for entering and updating data in the shelter’s databases, verifying the accuracy of information, generating reports, and maintaining confidential records. They will assist with tracking animal intake and adoptions, donor contributions, and volunteer hours.</p>','18','Administrative Assistant','<p>Candidates should possess strong attention to detail, excellent typing skills, and proficiency in Microsoft Office and database software. Previous experience in data entry or administration is preferred but not required. Volunteers should be comfortable working with computers, able to manage sensitive information discreetly, and have good organizational skills. A commitment to accuracy and a passion for animal welfare are essential.</p>','<p>Volunteers will complete an initial orientation covering the shelter’s mission, policies, and data entry protocols. Training will include hands-on instruction in using the shelter’s database software, data entry standards, and privacy guidelines. Ongoing support and periodic training sessions will be provided to ensure volunteers remain proficient and up-to-date with any system changes.</p>','Open','Flexible','Location-1');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-2','<p>Join our team at Toe Beans Animal Shelter as a Cat Care Assistant. Provide daily care, enrichment, and socialization for our feline residents. </p>','<p><span style="color: rgb(68, 68, 68);">Duties include feeding, cleaning, grooming, and playing with cats to ensure their well-being and happiness. Help create a loving and safe environment for our cats.</span></p>','18','Cat Care Assistant','<p>Passion for cats and their welfare, basic knowledge of feline behavior, and experience in pet care preferred. Ability to handle cats gently and confidently. Strong attention to detail, good communication skills, and reliability are essential. </p>','','Closed','A minimum of 4 hours per week','Location-2');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-3','<p>Become a Dog Walker at Toe Beans Animal Shelter and help our dogs stay active and healthy. Provide exercise, socialization, and companionship through regular walks. Join us in ensuring our dogs are happy and ready for adoption.</p>','<p>Walk shelter dogs on designated routes, ensuring their safety and well-being. Maintain control of dogs, adhering to shelter guidelines. Provide positive socialization and training reinforcement during walks. Monitor dogs for any signs of illness or distress and report concerns to staff. Clean up after dogs during walks and maintain a clean environment. Assist in transporting dogs to and from kennels. Interact positively with potential adopters during walks, showcasing the dogs&#39; personalities.</p>','18','Dog Walker','<p>Passion for animal welfare and experience with dogs preferred. Ability to handle dogs of various sizes and temperaments confidently. Strong communication skills and reliability. Physical capability to walk for extended periods and manage strong dogs. Must be patient, compassionate, and attentive to detail. </p>','<p>Completion of Toe Beans Animal Shelter&#39;s Dog Handling and Safety Training Program, including an orientation session and a supervised walking session with an experienced volunteer.</p>','Open','Minimum of 4 hours per week is required.','Location-3');
CREATE TABLE "VolunteerShiftAssignment__c" (
	id VARCHAR(255) NOT NULL, 
	"VolunteerAccount__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
	"VolunteerShift__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerShiftAssignment__c" VALUES('VolunteerShiftAssignment__c-1','','Contact-8','VolunteerShift__c-2');
CREATE TABLE "VolunteerShift__c" (
	id VARCHAR(255) NOT NULL, 
	"Description__c" VARCHAR(255), 
	"DurationHours__c" VARCHAR(255), 
	"MaximumVolunteersAllowed__c" VARCHAR(255), 
	"MinimumVolunteersNeeded__c" VARCHAR(255), 
	"StartDateTime__c" VARCHAR(255), 
	"VolunteersAssigned__c" VARCHAR(255), 
	"Location__c" VARCHAR(255), 
	"VolunteerActivity__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-1','','2.0','5.0','2.0','2024-06-06T21:00:00.000+0000','4.0','Location-2','VolunteerActivity__c-2');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-2','','2.0','5.0','2.0','2024-05-30T21:00:00.000+0000','3.0','Location-2','VolunteerActivity__c-2');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-3','','2.0','5.0','2.0','2024-06-20T21:00:00.000+0000','1.0','Location-2','VolunteerActivity__c-2');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-4','','2.0','5.0','2.0','2024-06-13T21:00:00.000+0000','2.0','Location-2','VolunteerActivity__c-2');
COMMIT;
