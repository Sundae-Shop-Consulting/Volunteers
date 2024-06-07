BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES('Account-1','Sample Account for Entitlements','');
INSERT INTO "Account" VALUES('Account-2','Sample Account for Entitlements','');
INSERT INTO "Account" VALUES('Account-3','Doe Household','');
INSERT INTO "Account" VALUES('Account-4','Harris Household','');
INSERT INTO "Account" VALUES('Account-5','Young Household','');
INSERT INTO "Account" VALUES('Account-6','Wright Household','');
INSERT INTO "Account" VALUES('Account-7','Scott Household','');
INSERT INTO "Account" VALUES('Account-8','Lewis Household','');
INSERT INTO "Account" VALUES('Account-9','Walker Household','');
INSERT INTO "Account" VALUES('Account-10','Harris Household','');
INSERT INTO "Account" VALUES('Account-11','Wilson Household','');
INSERT INTO "Account" VALUES('Account-12','Scott Household','');
INSERT INTO "Account" VALUES('Account-13','Smith Household','');
INSERT INTO "Account" VALUES('Account-14','Davis Household','');
INSERT INTO "Account" VALUES('Account-15','Jackson Household','');
INSERT INTO "Account" VALUES('Account-16','Wilson Household','');
INSERT INTO "Account" VALUES('Account-17','Robinson Household','');
INSERT INTO "Account" VALUES('Account-18','Jackson Household','');
INSERT INTO "Account" VALUES('Account-19','Wright Household','');
INSERT INTO "Account" VALUES('Account-20','Harris Household','');
INSERT INTO "Account" VALUES('Account-21','Young Household','');
INSERT INTO "Account" VALUES('Account-22','Hall Household','');
INSERT INTO "Account" VALUES('Account-23','Hall Household','');
INSERT INTO "Account" VALUES('Account-24','Allen Household','');
INSERT INTO "Account" VALUES('Account-25','Scott Household','');
INSERT INTO "Account" VALUES('Account-26','Wright Household','');
INSERT INTO "Account" VALUES('Account-27','Hall Household','');
INSERT INTO "Account" VALUES('Account-28','Anderson Household','');
INSERT INTO "Account" VALUES('Account-29','Robinson Household','');
INSERT INTO "Account" VALUES('Account-30','Davis Household','');
INSERT INTO "Account" VALUES('Account-31','Wilson Household','');
INSERT INTO "Account" VALUES('Account-32','Hall Household','');
INSERT INTO "Account" VALUES('Account-33','Walker Household','');
INSERT INTO "Account" VALUES('Account-34','Martinez Household','');
INSERT INTO "Account" VALUES('Account-35','Anderson Household','');
INSERT INTO "Account" VALUES('Account-36','Allen Household','');
INSERT INTO "Account" VALUES('Account-37','Hall Household','');
INSERT INTO "Account" VALUES('Account-38','Harris Household','');
INSERT INTO "Account" VALUES('Account-39','Davis Household','');
INSERT INTO "Account" VALUES('Account-40','Clark Household','');
INSERT INTO "Account" VALUES('Account-41','Robinson Household','');
INSERT INTO "Account" VALUES('Account-42','Davis Household','');
INSERT INTO "Account" VALUES('Account-43','Scott Household','');
INSERT INTO "Account" VALUES('Account-44','King Household','');
INSERT INTO "Account" VALUES('Account-45','Jackson Household','');
INSERT INTO "Account" VALUES('Account-46','Harris Household','');
INSERT INTO "Account" VALUES('Account-47','Walker Household','');
INSERT INTO "Account" VALUES('Account-48','King Household','');
INSERT INTO "Account" VALUES('Account-49','Wright Household','');
INSERT INTO "Account" VALUES('Account-50','Brown Household','');
INSERT INTO "Account" VALUES('Account-51','Allen Household','');
INSERT INTO "Account" VALUES('Account-52','Harris Household','');
INSERT INTO "Account" VALUES('Account-53','King Household','');
INSERT INTO "Account" VALUES('Account-54','Scott Household','');
INSERT INTO "Account" VALUES('Account-55','Wright Household','');
INSERT INTO "Account" VALUES('Account-56','Scott Household','');
INSERT INTO "Account" VALUES('Account-57','Scott Household','');
INSERT INTO "Account" VALUES('Account-58','Brown Household','');
INSERT INTO "Account" VALUES('Account-59','Jackson Household','');
INSERT INTO "Account" VALUES('Account-60','King Household','');
INSERT INTO "Account" VALUES('Account-61','Doe Household','');
INSERT INTO "Account" VALUES('Account-62','Wright Household','');
INSERT INTO "Account" VALUES('Account-63','Clark Household','');
INSERT INTO "Account" VALUES('Account-64','King Household','');
INSERT INTO "Account" VALUES('Account-65','Allen Household','');
INSERT INTO "Account" VALUES('Account-66','Wright Household','');
INSERT INTO "Account" VALUES('Account-67','Anderson Household','');
INSERT INTO "Account" VALUES('Account-68','Clark Household','');
INSERT INTO "Account" VALUES('Account-69','Allen Household','');
INSERT INTO "Account" VALUES('Account-70','Harris Household','');
INSERT INTO "Account" VALUES('Account-71','Wilson Household','');
INSERT INTO "Account" VALUES('Account-72','Anderson Household','');
INSERT INTO "Account" VALUES('Account-73','Robinson Household','');
INSERT INTO "Account" VALUES('Account-74','Wright Household','');
INSERT INTO "Account" VALUES('Account-75','Jackson Household','');
INSERT INTO "Account" VALUES('Account-76','Robinson Household','');
INSERT INTO "Account" VALUES('Account-77','Brown Household','');
INSERT INTO "Account" VALUES('Account-78','Wilson Household','');
INSERT INTO "Account" VALUES('Account-79','Thomas Household','');
INSERT INTO "Account" VALUES('Account-80','Anderson Household','');
INSERT INTO "Account" VALUES('Account-81','Jackson Household','');
INSERT INTO "Account" VALUES('Account-82','Thomas Household','');
INSERT INTO "Account" VALUES('Account-83','King Household','');
INSERT INTO "Account" VALUES('Account-84','Thomas Household','');
INSERT INTO "Account" VALUES('Account-85','Wright Household','');
INSERT INTO "Account" VALUES('Account-86','Wilson Household','');
INSERT INTO "Account" VALUES('Account-87','King Household','');
INSERT INTO "Account" VALUES('Account-88','Doe Household','');
INSERT INTO "Account" VALUES('Account-89','Robinson Household','');
INSERT INTO "Account" VALUES('Account-90','Clark Household','');
INSERT INTO "Account" VALUES('Account-91','Allen Household','');
INSERT INTO "Account" VALUES('Account-92','Davis Household','');
INSERT INTO "Account" VALUES('Account-93','Clark Household','');
INSERT INTO "Account" VALUES('Account-94','Young Household','');
INSERT INTO "Account" VALUES('Account-95','Smith Household','');
INSERT INTO "Account" VALUES('Account-96','Jackson Household','');
INSERT INTO "Account" VALUES('Account-97','Clark Household','');
INSERT INTO "Account" VALUES('Account-98','Brown Household','');
INSERT INTO "Account" VALUES('Account-99','Jackson Household','');
INSERT INTO "Account" VALUES('Account-100','Davis Household','');
INSERT INTO "Account" VALUES('Account-101','Scott Household','');
INSERT INTO "Account" VALUES('Account-102','Anderson Household','');
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
INSERT INTO "Contact" VALUES('Contact-1','False','Ava','False','False','Wilson','Account-11','');
INSERT INTO "Contact" VALUES('Contact-2','False','Charlotte','False','False','Scott','Account-101','');
INSERT INTO "Contact" VALUES('Contact-3','False','Ava','False','False','Anderson','Account-102','');
INSERT INTO "Contact" VALUES('Contact-4','False','Andrew','False','False','Scott','Account-12','');
INSERT INTO "Contact" VALUES('Contact-5','False','Laura','False','False','Smith','Account-13','');
INSERT INTO "Contact" VALUES('Contact-6','False','Mia','False','False','Davis','Account-14','');
INSERT INTO "Contact" VALUES('Contact-7','False','Daniel','False','False','Jackson','Account-15','');
INSERT INTO "Contact" VALUES('Contact-8','False','John','False','False','Wilson','Account-16','');
INSERT INTO "Contact" VALUES('Contact-9','False','Mia','False','False','Robinson','Account-17','');
INSERT INTO "Contact" VALUES('Contact-10','False','Sarah','False','False','Jackson','Account-18','');
INSERT INTO "Contact" VALUES('Contact-11','False','Michael','False','False','Wright','Account-19','');
INSERT INTO "Contact" VALUES('Contact-12','False','Samuel','False','False','Harris','Account-20','');
INSERT INTO "Contact" VALUES('Contact-13','False','David','False','False','Doe','Account-3','');
INSERT INTO "Contact" VALUES('Contact-14','False','Laura','False','False','Young','Account-21','');
INSERT INTO "Contact" VALUES('Contact-15','False','Matthew','False','False','Hall','Account-22','');
INSERT INTO "Contact" VALUES('Contact-16','False','Daniel','False','False','Hall','Account-23','');
INSERT INTO "Contact" VALUES('Contact-17','False','Andrew','False','False','Allen','Account-24','');
INSERT INTO "Contact" VALUES('Contact-18','False','Michael','False','False','Scott','Account-25','');
INSERT INTO "Contact" VALUES('Contact-19','False','Ava','False','False','Wright','Account-26','');
INSERT INTO "Contact" VALUES('Contact-20','False','James','False','False','Hall','Account-27','');
INSERT INTO "Contact" VALUES('Contact-21','False','John','False','False','Anderson','Account-28','');
INSERT INTO "Contact" VALUES('Contact-22','False','Isabella','False','False','Robinson','Account-29','');
INSERT INTO "Contact" VALUES('Contact-23','False','Isabella','False','False','Davis','Account-30','');
INSERT INTO "Contact" VALUES('Contact-24','False','Samuel','False','False','Harris','Account-4','');
INSERT INTO "Contact" VALUES('Contact-25','False','Andrew','False','False','Wilson','Account-31','');
INSERT INTO "Contact" VALUES('Contact-26','False','Laura','False','False','Hall','Account-32','');
INSERT INTO "Contact" VALUES('Contact-27','False','Chris','False','False','Walker','Account-33','');
INSERT INTO "Contact" VALUES('Contact-28','False','Michael','False','False','Martinez','Account-34','');
INSERT INTO "Contact" VALUES('Contact-29','False','John','False','False','Anderson','Account-35','');
INSERT INTO "Contact" VALUES('Contact-30','False','Andrew','False','False','Allen','Account-36','');
INSERT INTO "Contact" VALUES('Contact-31','False','Jane','False','False','Hall','Account-37','');
INSERT INTO "Contact" VALUES('Contact-32','False','David','False','False','Harris','Account-38','');
INSERT INTO "Contact" VALUES('Contact-33','False','Daniel','False','False','Clark','Account-40','');
INSERT INTO "Contact" VALUES('Contact-34','False','Laura','False','False','Young','Account-5','');
INSERT INTO "Contact" VALUES('Contact-35','False','Olivia','False','False','Robinson','Account-41','');
INSERT INTO "Contact" VALUES('Contact-36','False','Daniel','False','False','Davis','Account-42','');
INSERT INTO "Contact" VALUES('Contact-37','False','Emily','False','False','Scott','Account-43','');
INSERT INTO "Contact" VALUES('Contact-38','False','Matthew','False','False','King','Account-44','');
INSERT INTO "Contact" VALUES('Contact-39','False','David','False','False','Jackson','Account-45','');
INSERT INTO "Contact" VALUES('Contact-40','False','Michael','False','False','Harris','Account-46','');
INSERT INTO "Contact" VALUES('Contact-41','False','Daniel','False','False','Walker','Account-47','');
INSERT INTO "Contact" VALUES('Contact-42','False','Samuel','False','False','King','Account-48','');
INSERT INTO "Contact" VALUES('Contact-43','False','Mia','False','False','Wright','Account-49','');
INSERT INTO "Contact" VALUES('Contact-44','False','James','False','False','Brown','Account-50','');
INSERT INTO "Contact" VALUES('Contact-45','False','Andrew','False','False','Wright','Account-6','');
INSERT INTO "Contact" VALUES('Contact-46','False','Daniel','False','False','Allen','Account-51','');
INSERT INTO "Contact" VALUES('Contact-47','False','Sophia','False','False','Harris','Account-52','');
INSERT INTO "Contact" VALUES('Contact-48','False','Daniel','False','False','King','Account-53','');
INSERT INTO "Contact" VALUES('Contact-49','False','David','False','False','Scott','Account-54','');
INSERT INTO "Contact" VALUES('Contact-50','False','Michael','False','False','Wright','Account-55','');
INSERT INTO "Contact" VALUES('Contact-51','False','Chris','False','False','Scott','Account-56','');
INSERT INTO "Contact" VALUES('Contact-52','False','Joseph','False','False','Scott','Account-57','');
INSERT INTO "Contact" VALUES('Contact-53','False','Sarah','False','False','Brown','Account-58','');
INSERT INTO "Contact" VALUES('Contact-54','False','Chris','False','False','Jackson','Account-59','');
INSERT INTO "Contact" VALUES('Contact-55','False','Ava','False','False','King','Account-60','');
INSERT INTO "Contact" VALUES('Contact-56','False','Ava','False','False','Scott','Account-7','');
INSERT INTO "Contact" VALUES('Contact-57','False','Andrew','False','False','Doe','Account-61','');
INSERT INTO "Contact" VALUES('Contact-58','False','Laura','False','False','Wright','Account-62','');
INSERT INTO "Contact" VALUES('Contact-59','False','Sophia','False','False','Clark','Account-63','');
INSERT INTO "Contact" VALUES('Contact-60','False','Andrew','False','False','King','Account-64','');
INSERT INTO "Contact" VALUES('Contact-61','False','Laura','False','False','Allen','Account-65','');
INSERT INTO "Contact" VALUES('Contact-62','False','Chris','False','False','Wright','Account-66','');
INSERT INTO "Contact" VALUES('Contact-63','False','Emily','False','False','Anderson','Account-67','');
INSERT INTO "Contact" VALUES('Contact-64','False','Matthew','False','False','Clark','Account-68','');
INSERT INTO "Contact" VALUES('Contact-65','False','Mia','False','False','Allen','Account-69','');
INSERT INTO "Contact" VALUES('Contact-66','False','Charlotte','False','False','Harris','Account-70','');
INSERT INTO "Contact" VALUES('Contact-67','False','Olivia','False','False','Lewis','Account-8','');
INSERT INTO "Contact" VALUES('Contact-68','False','Charlotte','False','False','Wilson','Account-71','');
INSERT INTO "Contact" VALUES('Contact-69','False','Jane','False','False','Anderson','Account-72','');
INSERT INTO "Contact" VALUES('Contact-70','False','Olivia','False','False','Robinson','Account-73','');
INSERT INTO "Contact" VALUES('Contact-71','False','David','False','False','Wright','Account-74','');
INSERT INTO "Contact" VALUES('Contact-72','False','Chris','False','False','Jackson','Account-75','');
INSERT INTO "Contact" VALUES('Contact-73','False','Matthew','False','False','Robinson','Account-76','');
INSERT INTO "Contact" VALUES('Contact-74','False','Jane','False','False','Brown','Account-77','');
INSERT INTO "Contact" VALUES('Contact-75','False','Mia','False','False','Wilson','Account-78','');
INSERT INTO "Contact" VALUES('Contact-76','False','Samuel','False','False','Thomas','Account-79','');
INSERT INTO "Contact" VALUES('Contact-77','False','Laura','False','False','Anderson','Account-80','');
INSERT INTO "Contact" VALUES('Contact-78','False','Emily','False','False','Walker','Account-9','');
INSERT INTO "Contact" VALUES('Contact-79','False','John','False','False','Jackson','Account-81','');
INSERT INTO "Contact" VALUES('Contact-80','False','Daniel','False','False','Thomas','Account-82','');
INSERT INTO "Contact" VALUES('Contact-81','False','Isabella','False','False','King','Account-83','');
INSERT INTO "Contact" VALUES('Contact-82','False','Andrew','False','False','Thomas','Account-84','');
INSERT INTO "Contact" VALUES('Contact-83','False','Olivia','False','False','Wright','Account-85','');
INSERT INTO "Contact" VALUES('Contact-84','False','James','False','False','Wilson','Account-86','');
INSERT INTO "Contact" VALUES('Contact-85','False','Emily','False','False','King','Account-87','');
INSERT INTO "Contact" VALUES('Contact-86','False','Samuel','False','False','Doe','Account-88','');
INSERT INTO "Contact" VALUES('Contact-87','False','Matthew','False','False','Robinson','Account-89','');
INSERT INTO "Contact" VALUES('Contact-88','False','Emily','False','False','Clark','Account-90','');
INSERT INTO "Contact" VALUES('Contact-89','False','Charlotte','False','False','Harris','Account-10','');
INSERT INTO "Contact" VALUES('Contact-90','False','Ava','False','False','Allen','Account-91','');
INSERT INTO "Contact" VALUES('Contact-91','False','Isabella','False','False','Davis','Account-92','');
INSERT INTO "Contact" VALUES('Contact-92','False','Sophia','False','False','Clark','Account-93','');
INSERT INTO "Contact" VALUES('Contact-93','False','Emily','False','False','Young','Account-94','');
INSERT INTO "Contact" VALUES('Contact-94','False','Ava','False','False','Smith','Account-95','');
INSERT INTO "Contact" VALUES('Contact-95','False','Andrew','False','False','Jackson','Account-96','');
INSERT INTO "Contact" VALUES('Contact-96','False','Samuel','False','False','Clark','Account-97','');
INSERT INTO "Contact" VALUES('Contact-97','False','Sophia','False','False','Brown','Account-98','');
INSERT INTO "Contact" VALUES('Contact-98','False','Laura','False','False','Jackson','Account-99','');
INSERT INTO "Contact" VALUES('Contact-99','False','James','False','False','Davis','Account-100','');
CREATE TABLE "Location" (
	id VARCHAR(255) NOT NULL, 
	"IsInventoryLocation" VARCHAR(255), 
	"IsMobile" VARCHAR(255), 
	"LocationType" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"ShouldSyncWithOci" VARCHAR(255), 
	"ParentLocationId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Location" VALUES('Location-1','False','False','Site','Toe Beans Animal Rescue - Main Office','False','');
INSERT INTO "Location" VALUES('Location-2','False','False','Site','Toe Beans Cat Shelter - Shoreline','False','');
INSERT INTO "Location" VALUES('Location-3','False','False','Site','Toe Beans Dog Shelter - Kirkland','False','');
CREATE TABLE "VolunteerActivityAssignment__c" (
	id VARCHAR(255) NOT NULL, 
	"VolunteerAccount__c" VARCHAR(255), 
	"VolunteerActivity__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerActivityAssignment__c" VALUES('VolunteerActivityAssignment__c-1','','VolunteerActivity__c-2','Contact-6');
INSERT INTO "VolunteerActivityAssignment__c" VALUES('VolunteerActivityAssignment__c-2','','VolunteerActivity__c-1','Contact-6');
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
INSERT INTO "VolunteerActivity__c" VALUES('VolunteerActivity__c-1','Join us Thursdays at 2 p.m. to clean litter boxes, change food and water, and cuddle with kittens.','5.0','2.0','Cat Care - Thursday Afternoons','1.0','Location-2','','VolunteerPosition__c-2');
INSERT INTO "VolunteerActivity__c" VALUES('VolunteerActivity__c-2','Ongoing activity for data-entry related tasks. Input and manage vital information regarding shelter animals, adoptions, donations, and volunteers.','5.0','1.0','Data Entry','1.0','Location-1','','VolunteerPosition__c-1');
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
INSERT INTO "VolunteerPositionAssignment__c" VALUES('VolunteerPositionAssignment__c-1','','Contact-6','VolunteerPosition__c-1');
INSERT INTO "VolunteerPositionAssignment__c" VALUES('VolunteerPositionAssignment__c-2','','Contact-6','VolunteerPosition__c-2');
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
INSERT INTO "VolunteerShiftAssignment__c" VALUES('VolunteerShiftAssignment__c-1','','Contact-6','VolunteerShift__c-2');
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
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-1','','2.0','5.0','2.0','2024-06-06T21:00:00.000+0000','4.0','Location-2','VolunteerActivity__c-1');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-2','','2.0','5.0','2.0','2024-05-30T21:00:00.000+0000','3.0','Location-2','VolunteerActivity__c-1');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-3','','2.0','5.0','2.0','2024-06-20T21:00:00.000+0000','1.0','Location-2','VolunteerActivity__c-1');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-4','','2.0','5.0','2.0','2024-06-13T21:00:00.000+0000','2.0','Location-2','VolunteerActivity__c-1');
COMMIT;
