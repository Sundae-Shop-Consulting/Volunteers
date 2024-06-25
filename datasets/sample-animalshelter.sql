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
INSERT INTO "Account" VALUES('Account-4','Sample Account for Entitlements','');
INSERT INTO "Account" VALUES('Account-5','Doe Household','');
INSERT INTO "Account" VALUES('Account-6','Harris Household','');
INSERT INTO "Account" VALUES('Account-7','Young Household','');
INSERT INTO "Account" VALUES('Account-8','Wright Household','');
INSERT INTO "Account" VALUES('Account-9','Scott Household','');
INSERT INTO "Account" VALUES('Account-10','Lewis Household','');
INSERT INTO "Account" VALUES('Account-11','Walker Household','');
INSERT INTO "Account" VALUES('Account-12','Harris Household','');
INSERT INTO "Account" VALUES('Account-13','Wilson Household','');
INSERT INTO "Account" VALUES('Account-14','Scott Household','');
INSERT INTO "Account" VALUES('Account-15','Smith Household','');
INSERT INTO "Account" VALUES('Account-16','Davis Household','');
INSERT INTO "Account" VALUES('Account-17','Jackson Household','');
INSERT INTO "Account" VALUES('Account-18','Wilson Household','');
INSERT INTO "Account" VALUES('Account-19','Robinson Household','');
INSERT INTO "Account" VALUES('Account-20','Jackson Household','');
INSERT INTO "Account" VALUES('Account-21','Wright Household','');
INSERT INTO "Account" VALUES('Account-22','Harris Household','');
INSERT INTO "Account" VALUES('Account-23','Young Household','');
INSERT INTO "Account" VALUES('Account-24','Hall Household','');
INSERT INTO "Account" VALUES('Account-25','Hall Household','');
INSERT INTO "Account" VALUES('Account-26','Allen Household','');
INSERT INTO "Account" VALUES('Account-27','Scott Household','');
INSERT INTO "Account" VALUES('Account-28','Wright Household','');
INSERT INTO "Account" VALUES('Account-29','Hall Household','');
INSERT INTO "Account" VALUES('Account-30','Anderson Household','');
INSERT INTO "Account" VALUES('Account-31','Robinson Household','');
INSERT INTO "Account" VALUES('Account-32','Davis Household','');
INSERT INTO "Account" VALUES('Account-33','Wilson Household','');
INSERT INTO "Account" VALUES('Account-34','Hall Household','');
INSERT INTO "Account" VALUES('Account-35','Walker Household','');
INSERT INTO "Account" VALUES('Account-36','Martinez Household','');
INSERT INTO "Account" VALUES('Account-37','Anderson Household','');
INSERT INTO "Account" VALUES('Account-38','Allen Household','');
INSERT INTO "Account" VALUES('Account-39','Hall Household','');
INSERT INTO "Account" VALUES('Account-40','Harris Household','');
INSERT INTO "Account" VALUES('Account-41','Davis Household','');
INSERT INTO "Account" VALUES('Account-42','Clark Household','');
INSERT INTO "Account" VALUES('Account-43','Robinson Household','');
INSERT INTO "Account" VALUES('Account-44','Davis Household','');
INSERT INTO "Account" VALUES('Account-45','Scott Household','');
INSERT INTO "Account" VALUES('Account-46','King Household','');
INSERT INTO "Account" VALUES('Account-47','Jackson Household','');
INSERT INTO "Account" VALUES('Account-48','Harris Household','');
INSERT INTO "Account" VALUES('Account-49','Walker Household','');
INSERT INTO "Account" VALUES('Account-50','King Household','');
INSERT INTO "Account" VALUES('Account-51','Wright Household','');
INSERT INTO "Account" VALUES('Account-52','Brown Household','');
INSERT INTO "Account" VALUES('Account-53','Allen Household','');
INSERT INTO "Account" VALUES('Account-54','Harris Household','');
INSERT INTO "Account" VALUES('Account-55','King Household','');
INSERT INTO "Account" VALUES('Account-56','Scott Household','');
INSERT INTO "Account" VALUES('Account-57','Wright Household','');
INSERT INTO "Account" VALUES('Account-58','Scott Household','');
INSERT INTO "Account" VALUES('Account-59','Scott Household','');
INSERT INTO "Account" VALUES('Account-60','Brown Household','');
INSERT INTO "Account" VALUES('Account-61','Jackson Household','');
INSERT INTO "Account" VALUES('Account-62','King Household','');
INSERT INTO "Account" VALUES('Account-63','Doe Household','');
INSERT INTO "Account" VALUES('Account-64','Wright Household','');
INSERT INTO "Account" VALUES('Account-65','Clark Household','');
INSERT INTO "Account" VALUES('Account-66','King Household','');
INSERT INTO "Account" VALUES('Account-67','Allen Household','');
INSERT INTO "Account" VALUES('Account-68','Wright Household','');
INSERT INTO "Account" VALUES('Account-69','Anderson Household','');
INSERT INTO "Account" VALUES('Account-70','Clark Household','');
INSERT INTO "Account" VALUES('Account-71','Allen Household','');
INSERT INTO "Account" VALUES('Account-72','Harris Household','');
INSERT INTO "Account" VALUES('Account-73','Wilson Household','');
INSERT INTO "Account" VALUES('Account-74','Anderson Household','');
INSERT INTO "Account" VALUES('Account-75','Robinson Household','');
INSERT INTO "Account" VALUES('Account-76','Wright Household','');
INSERT INTO "Account" VALUES('Account-77','Jackson Household','');
INSERT INTO "Account" VALUES('Account-78','Robinson Household','');
INSERT INTO "Account" VALUES('Account-79','Brown Household','');
INSERT INTO "Account" VALUES('Account-80','Wilson Household','');
INSERT INTO "Account" VALUES('Account-81','Thomas Household','');
INSERT INTO "Account" VALUES('Account-82','Anderson Household','');
INSERT INTO "Account" VALUES('Account-83','Jackson Household','');
INSERT INTO "Account" VALUES('Account-84','Thomas Household','');
INSERT INTO "Account" VALUES('Account-85','King Household','');
INSERT INTO "Account" VALUES('Account-86','Thomas Household','');
INSERT INTO "Account" VALUES('Account-87','Wright Household','');
INSERT INTO "Account" VALUES('Account-88','Wilson Household','');
INSERT INTO "Account" VALUES('Account-89','King Household','');
INSERT INTO "Account" VALUES('Account-90','Doe Household','');
INSERT INTO "Account" VALUES('Account-91','Robinson Household','');
INSERT INTO "Account" VALUES('Account-92','Clark Household','');
INSERT INTO "Account" VALUES('Account-93','Allen Household','');
INSERT INTO "Account" VALUES('Account-94','Davis Household','');
INSERT INTO "Account" VALUES('Account-95','Clark Household','');
INSERT INTO "Account" VALUES('Account-96','Young Household','');
INSERT INTO "Account" VALUES('Account-97','Smith Household','');
INSERT INTO "Account" VALUES('Account-98','Jackson Household','');
INSERT INTO "Account" VALUES('Account-99','Clark Household','');
INSERT INTO "Account" VALUES('Account-100','Brown Household','');
INSERT INTO "Account" VALUES('Account-101','Jackson Household','');
INSERT INTO "Account" VALUES('Account-102','Davis Household','');
INSERT INTO "Account" VALUES('Account-103','Scott Household','');
INSERT INTO "Account" VALUES('Account-104','Anderson Household','');
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
	"ParentId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Address" VALUES('Address-1','','555 Cherry Ave','Seattle','WA','98133','','','','Site','Mailing','Location-1');
INSERT INTO "Address" VALUES('Address-2','','555 Main Street','','','','','','','Warehouse','Mailing','Location-1');
INSERT INTO "Address" VALUES('Address-3','','1234 Mockingbird Lane','Shoreline','WA','98133','','','','Site','Mailing','Location-2');
INSERT INTO "Address" VALUES('Address-4','','555 Rosebud Lane','Kirkland','WA','98004','','','','Site','Mailing','Location-3');
CREATE TABLE "Contact" (
	id VARCHAR(255) NOT NULL, 
	"DoNotCall" VARCHAR(255), 
	"FirstName" VARCHAR(255), 
	"FirstVolunteerDate__c" VARCHAR(255), 
	"HasOptedOutOfEmail" VARCHAR(255), 
	"HasOptedOutOfFax" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"LastVolunteerDate__c" VARCHAR(255), 
	"VolunteerHours__c" VARCHAR(255), 
	"AccountId" VARCHAR(255), 
	"ReportsToId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Contact" VALUES('Contact-1','False','Emily','','False','False','Walker','','','Account-11','');
INSERT INTO "Contact" VALUES('Contact-2','False','Laura','','False','False','Jackson','','','Account-101','');
INSERT INTO "Contact" VALUES('Contact-3','False','James','','False','False','Davis','','','Account-102','');
INSERT INTO "Contact" VALUES('Contact-4','False','Charlotte','','False','False','Scott','','','Account-103','');
INSERT INTO "Contact" VALUES('Contact-5','False','Ava','','False','False','Anderson','','','Account-104','');
INSERT INTO "Contact" VALUES('Contact-6','False','Charlotte','','False','False','Harris','','','Account-12','');
INSERT INTO "Contact" VALUES('Contact-7','False','Ava','','False','False','Wilson','','','Account-13','');
INSERT INTO "Contact" VALUES('Contact-8','False','Andrew','','False','False','Scott','','','Account-14','');
INSERT INTO "Contact" VALUES('Contact-9','False','Laura','','False','False','Smith','','','Account-15','');
INSERT INTO "Contact" VALUES('Contact-10','False','Mia','','False','False','Davis','','2.5','Account-16','');
INSERT INTO "Contact" VALUES('Contact-11','False','Daniel','','False','False','Jackson','','','Account-17','');
INSERT INTO "Contact" VALUES('Contact-12','False','John','','False','False','Wilson','','','Account-18','');
INSERT INTO "Contact" VALUES('Contact-13','False','Mia','','False','False','Robinson','','','Account-19','');
INSERT INTO "Contact" VALUES('Contact-14','False','Sarah','','False','False','Jackson','','','Account-20','');
INSERT INTO "Contact" VALUES('Contact-15','False','Michael','','False','False','Wright','','','Account-21','');
INSERT INTO "Contact" VALUES('Contact-16','False','Samuel','','False','False','Harris','','','Account-22','');
INSERT INTO "Contact" VALUES('Contact-17','False','Laura','','False','False','Young','','','Account-23','');
INSERT INTO "Contact" VALUES('Contact-18','False','Matthew','','False','False','Hall','','','Account-24','');
INSERT INTO "Contact" VALUES('Contact-19','False','Daniel','','False','False','Hall','','','Account-25','');
INSERT INTO "Contact" VALUES('Contact-20','False','Andrew','','False','False','Allen','','','Account-26','');
INSERT INTO "Contact" VALUES('Contact-21','False','Michael','','False','False','Scott','','','Account-27','');
INSERT INTO "Contact" VALUES('Contact-22','False','Ava','','False','False','Wright','','','Account-28','');
INSERT INTO "Contact" VALUES('Contact-23','False','James','','False','False','Hall','','','Account-29','');
INSERT INTO "Contact" VALUES('Contact-24','False','John','','False','False','Anderson','','','Account-30','');
INSERT INTO "Contact" VALUES('Contact-25','False','Isabella','','False','False','Robinson','','','Account-31','');
INSERT INTO "Contact" VALUES('Contact-26','False','Isabella','','False','False','Davis','','','Account-32','');
INSERT INTO "Contact" VALUES('Contact-27','False','Andrew','','False','False','Wilson','','','Account-33','');
INSERT INTO "Contact" VALUES('Contact-28','False','Laura','','False','False','Hall','','','Account-34','');
INSERT INTO "Contact" VALUES('Contact-29','False','Chris','','False','False','Walker','','','Account-35','');
INSERT INTO "Contact" VALUES('Contact-30','False','Michael','','False','False','Martinez','','','Account-36','');
INSERT INTO "Contact" VALUES('Contact-31','False','John','','False','False','Anderson','','','Account-37','');
INSERT INTO "Contact" VALUES('Contact-32','False','Andrew','','False','False','Allen','','','Account-38','');
INSERT INTO "Contact" VALUES('Contact-33','False','Jane','','False','False','Hall','','','Account-39','');
INSERT INTO "Contact" VALUES('Contact-34','False','David','','False','False','Harris','','','Account-40','');
INSERT INTO "Contact" VALUES('Contact-35','False','David','','False','False','Doe','','','Account-5','');
INSERT INTO "Contact" VALUES('Contact-36','False','Daniel','','False','False','Clark','','','Account-42','');
INSERT INTO "Contact" VALUES('Contact-37','False','Olivia','','False','False','Robinson','','','Account-43','');
INSERT INTO "Contact" VALUES('Contact-38','False','Daniel','','False','False','Davis','','','Account-44','');
INSERT INTO "Contact" VALUES('Contact-39','False','Emily','','False','False','Scott','','','Account-45','');
INSERT INTO "Contact" VALUES('Contact-40','False','Matthew','','False','False','King','','','Account-46','');
INSERT INTO "Contact" VALUES('Contact-41','False','David','','False','False','Jackson','','','Account-47','');
INSERT INTO "Contact" VALUES('Contact-42','False','Michael','','False','False','Harris','','','Account-48','');
INSERT INTO "Contact" VALUES('Contact-43','False','Daniel','','False','False','Walker','','','Account-49','');
INSERT INTO "Contact" VALUES('Contact-44','False','Samuel','','False','False','King','','','Account-50','');
INSERT INTO "Contact" VALUES('Contact-45','False','Samuel','','False','False','Harris','','','Account-6','');
INSERT INTO "Contact" VALUES('Contact-46','False','Mia','','False','False','Wright','','','Account-51','');
INSERT INTO "Contact" VALUES('Contact-47','False','James','','False','False','Brown','','','Account-52','');
INSERT INTO "Contact" VALUES('Contact-48','False','Daniel','','False','False','Allen','','','Account-53','');
INSERT INTO "Contact" VALUES('Contact-49','False','Sophia','','False','False','Harris','','','Account-54','');
INSERT INTO "Contact" VALUES('Contact-50','False','Daniel','','False','False','King','','','Account-55','');
INSERT INTO "Contact" VALUES('Contact-51','False','David','','False','False','Scott','','','Account-56','');
INSERT INTO "Contact" VALUES('Contact-52','False','Michael','','False','False','Wright','','','Account-57','');
INSERT INTO "Contact" VALUES('Contact-53','False','Chris','','False','False','Scott','','','Account-58','');
INSERT INTO "Contact" VALUES('Contact-54','False','Joseph','','False','False','Scott','','','Account-59','');
INSERT INTO "Contact" VALUES('Contact-55','False','Sarah','','False','False','Brown','','','Account-60','');
INSERT INTO "Contact" VALUES('Contact-56','False','Laura','','False','False','Young','','','Account-7','');
INSERT INTO "Contact" VALUES('Contact-57','False','Chris','','False','False','Jackson','','','Account-61','');
INSERT INTO "Contact" VALUES('Contact-58','False','Ava','','False','False','King','','','Account-62','');
INSERT INTO "Contact" VALUES('Contact-59','False','Andrew','','False','False','Doe','','','Account-63','');
INSERT INTO "Contact" VALUES('Contact-60','False','Laura','','False','False','Wright','','','Account-64','');
INSERT INTO "Contact" VALUES('Contact-61','False','Sophia','','False','False','Clark','','','Account-65','');
INSERT INTO "Contact" VALUES('Contact-62','False','Andrew','','False','False','King','','','Account-66','');
INSERT INTO "Contact" VALUES('Contact-63','False','Laura','','False','False','Allen','','','Account-67','');
INSERT INTO "Contact" VALUES('Contact-64','False','Chris','','False','False','Wright','','','Account-68','');
INSERT INTO "Contact" VALUES('Contact-65','False','Emily','','False','False','Anderson','','','Account-69','');
INSERT INTO "Contact" VALUES('Contact-66','False','Matthew','','False','False','Clark','','','Account-70','');
INSERT INTO "Contact" VALUES('Contact-67','False','Andrew','','False','False','Wright','','','Account-8','');
INSERT INTO "Contact" VALUES('Contact-68','False','Mia','','False','False','Allen','','','Account-71','');
INSERT INTO "Contact" VALUES('Contact-69','False','Charlotte','','False','False','Harris','','','Account-72','');
INSERT INTO "Contact" VALUES('Contact-70','False','Charlotte','','False','False','Wilson','','','Account-73','');
INSERT INTO "Contact" VALUES('Contact-71','False','Jane','','False','False','Anderson','','','Account-74','');
INSERT INTO "Contact" VALUES('Contact-72','False','Olivia','','False','False','Robinson','','','Account-75','');
INSERT INTO "Contact" VALUES('Contact-73','False','David','','False','False','Wright','','','Account-76','');
INSERT INTO "Contact" VALUES('Contact-74','False','Chris','','False','False','Jackson','','','Account-77','');
INSERT INTO "Contact" VALUES('Contact-75','False','Matthew','','False','False','Robinson','','','Account-78','');
INSERT INTO "Contact" VALUES('Contact-76','False','Jane','','False','False','Brown','','','Account-79','');
INSERT INTO "Contact" VALUES('Contact-77','False','Mia','','False','False','Wilson','','','Account-80','');
INSERT INTO "Contact" VALUES('Contact-78','False','Ava','','False','False','Scott','','','Account-9','');
INSERT INTO "Contact" VALUES('Contact-79','False','Samuel','','False','False','Thomas','','','Account-81','');
INSERT INTO "Contact" VALUES('Contact-80','False','Laura','','False','False','Anderson','','','Account-82','');
INSERT INTO "Contact" VALUES('Contact-81','False','John','','False','False','Jackson','','','Account-83','');
INSERT INTO "Contact" VALUES('Contact-82','False','Daniel','','False','False','Thomas','','','Account-84','');
INSERT INTO "Contact" VALUES('Contact-83','False','Isabella','','False','False','King','','','Account-85','');
INSERT INTO "Contact" VALUES('Contact-84','False','Andrew','','False','False','Thomas','','','Account-86','');
INSERT INTO "Contact" VALUES('Contact-85','False','Olivia','','False','False','Wright','','','Account-87','');
INSERT INTO "Contact" VALUES('Contact-86','False','James','','False','False','Wilson','','','Account-88','');
INSERT INTO "Contact" VALUES('Contact-87','False','Emily','','False','False','King','','','Account-89','');
INSERT INTO "Contact" VALUES('Contact-88','False','Samuel','','False','False','Doe','','','Account-90','');
INSERT INTO "Contact" VALUES('Contact-89','False','Olivia','','False','False','Lewis','','','Account-10','');
INSERT INTO "Contact" VALUES('Contact-90','False','Matthew','','False','False','Robinson','','','Account-91','');
INSERT INTO "Contact" VALUES('Contact-91','False','Emily','','False','False','Clark','','','Account-92','');
INSERT INTO "Contact" VALUES('Contact-92','False','Ava','','False','False','Allen','','','Account-93','');
INSERT INTO "Contact" VALUES('Contact-93','False','Isabella','','False','False','Davis','','','Account-94','');
INSERT INTO "Contact" VALUES('Contact-94','False','Sophia','','False','False','Clark','','','Account-95','');
INSERT INTO "Contact" VALUES('Contact-95','False','Emily','','False','False','Young','','','Account-96','');
INSERT INTO "Contact" VALUES('Contact-96','False','Ava','','False','False','Smith','','','Account-97','');
INSERT INTO "Contact" VALUES('Contact-97','False','Andrew','','False','False','Jackson','','','Account-98','');
INSERT INTO "Contact" VALUES('Contact-98','False','Samuel','','False','False','Clark','','','Account-99','');
INSERT INTO "Contact" VALUES('Contact-99','False','Sophia','','False','False','Brown','','','Account-100','');
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
INSERT INTO "VolunteerActivityAssignment__c" VALUES('VolunteerActivityAssignment__c-1','','VolunteerActivity__c-2','Contact-10');
INSERT INTO "VolunteerActivityAssignment__c" VALUES('VolunteerActivityAssignment__c-2','','VolunteerActivity__c-3','Contact-10');
CREATE TABLE "VolunteerActivity__c" (
	id VARCHAR(255) NOT NULL, 
	"Description__c" VARCHAR(255), 
	"FirstShiftDateTime__c" VARCHAR(255), 
	"MaximumVolunteersAllowed__c" VARCHAR(255), 
	"MinimumVolunteersNeeded__c" VARCHAR(255), 
	"Name" VARCHAR(255), 
	"VolunteerHours__c" VARCHAR(255), 
	"VolunteersAssigned__c" VARCHAR(255), 
	"Location__c" VARCHAR(255), 
	"VolunteerEvent__c" VARCHAR(255), 
	"VolunteerPosition__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerActivity__c" VALUES('VolunteerActivity__c-1','Handle miscellaneous tasks throughout the day as assigned on site. Examples include:
- Set up markers along the parade route before the parade begins. 
- Hand out water at stations along the route. 
- Pick up trash and route markers after the parade has ended.','2024-06-30T19:00:00.000+0000','20.0','10.0','Parade Support','','','','VolunteerEvent__c-1','VolunteerPosition__c-1');
INSERT INTO "VolunteerActivity__c" VALUES('VolunteerActivity__c-2','Ongoing activity for data-entry related tasks. Input and manage vital information regarding shelter animals, adoptions, donations, and volunteers.','','5.0','1.0','Data Entry','','1.0','Location-1','','VolunteerPosition__c-3');
INSERT INTO "VolunteerActivity__c" VALUES('VolunteerActivity__c-3','Join us Thursdays at 2 p.m. to clean litter boxes, change food and water, and cuddle with kittens.','2024-05-30T21:00:00.000+0000','5.0','2.0','Cat Care - Thursday Afternoons','2.5','1.0','Location-2','','VolunteerPosition__c-4');
INSERT INTO "VolunteerActivity__c" VALUES('VolunteerActivity__c-4','As a volunteer at the Adoption Booth during Toe Beans on Parade, you''ll play a vital role in connecting potential adopters with our lovable shelter animals. Your duties will include:

Engaging with Visitors: Welcome attendees warmly and engage them in conversation about our adoptable animals.

Providing Information: Share details about each animal''s personality, background, and care needs to help match them with suitable adoptive families.

Assisting with Applications: Aid visitors in filling out adoption applications and provide guidance on the process.

Animal Handling: Assist in safely handling animals during interactions with potential adopters, ensuring their comfort and safety.

Promoting Adoption: Advocate for the benefits of pet adoption and highlight the joys of welcoming a shelter animal into a loving home.

Maintaining Booth Appearance: Ensure the booth is organized, clean, and attractive to visitors throughout the event.

Your dedication and enthusiasm will help make this event a success by facilitating adoptions and spreading awareness about responsible pet ownership. Join us at the Adoption Booth and be a part of finding forever homes for our deserving animals!','2024-07-06T15:00:00.000+0000','6.0','2.0','Adoption Booth','','','','VolunteerEvent__c-1','VolunteerPosition__c-2');
CREATE TABLE "VolunteerEvent__c" (
	id VARCHAR(255) NOT NULL, 
	"Description__c" VARCHAR(255), 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerEvent__c" VALUES('VolunteerEvent__c-1','<p>Join us for an unforgettable day of fun, fur, and fundraising at Toe Beans on Parade, Toe Beans Animal Rescue&#39;s premier annual event! This community extravaganza is not just a fundraiser but a celebration of compassion and commitment to our beloved furry friends.</p>','Toe Beans on Parade');
CREATE TABLE "VolunteerHoursLog__c" (
	id VARCHAR(255) NOT NULL, 
	"Comments__c" VARCHAR(255), 
	"EndDateTime__c" VARCHAR(255), 
	"EndDate__c" VARCHAR(255), 
	"Hours__c" VARCHAR(255), 
	"PlannedStartDateTime__c" VARCHAR(255), 
	"StartDateTime__c" VARCHAR(255), 
	"StartDate__c" VARCHAR(255), 
	"VolunteerActivity__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerHoursLog__c" VALUES('VolunteerHoursLog__c-1','','','','2.5','','2024-06-20T21:00:00.000+0000','','VolunteerActivity__c-3','Contact-10');
CREATE TABLE "VolunteerPositionAssignment__c" (
	id VARCHAR(255) NOT NULL, 
	"VolunteerAccount__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
	"VolunteerPosition__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerPositionAssignment__c" VALUES('VolunteerPositionAssignment__c-1','','Contact-10','VolunteerPosition__c-3');
INSERT INTO "VolunteerPositionAssignment__c" VALUES('VolunteerPositionAssignment__c-2','','Contact-10','VolunteerPosition__c-4');
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
	"VolunteerActivities__c" VARCHAR(255), 
	"VolunteerHours__c" VARCHAR(255), 
	"VolunteersAssigned__c" VARCHAR(255), 
	"Location__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-1','<p>Event Volunteers at Toe Beans Animal Rescue play a crucial role in supporting and facilitating various events aimed at promoting animal welfare, adoption drives, fundraising activities, and community outreach efforts.</p>','<ol><li>Assist in setting up and dismantling event spaces.</li><li>Engage with event attendees, providing information about Toe Beans and its mission.</li><li>Help coordinate activities such as merchandise sales or donation collections.</li><li>Promote a positive image of the shelter and encourage community involvement.</li><li>Support event organizers in ensuring smooth operations throughout the event.</li></ol>','Event Volunteers typically need to be at least 16 years old, though younger volunteers may be considered with parental consent and supervision.','Event Volunteer','<ol><li>Passion for animal welfare and a commitment to the mission of Toe Beans Animal Rescue.</li><li>Good interpersonal and communication skills.</li><li>Ability to work effectively in a team and independently as needed.</li><li>Comfortable engaging with diverse groups of people and animals.</li><li>Reliable and punctual.</li></ol>','<p>Training sessions provided by Toe Beans Animal Rescue may include:</p><ul><li>Orientation to familiarize volunteers with the shelter&#39;s mission and policies.</li><li>Specific event-related training, such as handling procedures during adoption events or safety guidelines.</li></ul>','Open','Event Volunteers typically commit to specific event dates and preparation times. This can range from a few hours for smaller events to a full day or weekend for larger ones. Flexibility in scheduling is often appreciated.','1.0','','','');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-2','<p>Adoption Support Volunteers at Toe Beans Animal Rescue are essential in facilitating the adoption process for animals looking for their forever homes. They provide direct support to potential adopters and ensure a smooth transition for animals into loving families.</p>','<ol><li>Assist potential adopters in navigating the adoption process.</li><li>Interact with shelter animals to assess their behavior and personality traits.</li><li>Help match animals with suitable adoptive families based on their needs and preferences.</li><li>Provide information about adoption fees, procedures, and post-adoption support services.</li><li>Support administrative tasks related to adoption paperwork and records management.</li></ol>','Adoption Support Volunteers typically need to be at least 18 years old due to the responsibilities involved in handling sensitive adoption processes and paperwork.','Adoption Support Volunteer','<ol><li>Passion for animal welfare and a genuine interest in finding homes for shelter animals.</li><li>Patience and empathy in dealing with potential adopters and animals.</li><li>Good communication skills to convey information effectively and compassionately.</li><li>Ability to handle sensitive information with confidentiality.</li><li>Willingness to learn and follow shelter policies and procedures.</li></ol>','<ul><li>Orientation to familiarize volunteers with the shelter’s mission, adoption guidelines, and animal handling protocols.</li><li>Training on customer service techniques and effective communication with adopters.</li><li>Specific training on using adoption software or databases for record-keeping.</li></ul>','Open','Adoption Support Volunteers typically commit to regular shifts at the shelter, ranging from a few hours per week to multiple shifts depending on availability and shelter needs. Flexibility in scheduling is often beneficial.','1.0','','','');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-3','<p>Administrative assistants at Toe Beans Animal Shelter will input and manage vital information regarding shelter animals, adoptions, donations, and volunteers to ensure accurate and up-to-date records that support the shelter’s operations and outreach efforts.</p>','<p>Administrative assistants will be responsible for entering and updating data in the shelter’s databases, verifying the accuracy of information, generating reports, and maintaining confidential records. They will assist with tracking animal intake and adoptions, donor contributions, and volunteer hours.</p>','18','Administrative Assistant','<p>Candidates should possess strong attention to detail, excellent typing skills, and proficiency in Microsoft Office and database software. Previous experience in data entry or administration is preferred but not required. Volunteers should be comfortable working with computers, able to manage sensitive information discreetly, and have good organizational skills. A commitment to accuracy and a passion for animal welfare are essential.</p>','<p>Volunteers will complete an initial orientation covering the shelter’s mission, policies, and data entry protocols. Training will include hands-on instruction in using the shelter’s database software, data entry standards, and privacy guidelines. Ongoing support and periodic training sessions will be provided to ensure volunteers remain proficient and up-to-date with any system changes.</p>','Open','Flexible','1.0','','1.0','Location-1');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-4','<p>Join our team at Toe Beans Animal Shelter as a Cat Care Assistant. Provide daily care, enrichment, and socialization for our feline residents. </p>','<p><span style="color: rgb(68, 68, 68);">Duties include feeding, cleaning, grooming, and playing with cats to ensure their well-being and happiness. Help create a loving and safe environment for our cats.</span></p>','18','Cat Care Assistant','<p>Passion for cats and their welfare, basic knowledge of feline behavior, and experience in pet care preferred. Ability to handle cats gently and confidently. Strong attention to detail, good communication skills, and reliability are essential. </p>','','Closed','A minimum of 4 hours per week','1.0','2.5','1.0','Location-2');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-5','<p>Become a Dog Walker at Toe Beans Animal Shelter and help our dogs stay active and healthy. Provide exercise, socialization, and companionship through regular walks. Join us in ensuring our dogs are happy and ready for adoption.</p>','<p>Walk shelter dogs on designated routes, ensuring their safety and well-being. Maintain control of dogs, adhering to shelter guidelines. Provide positive socialization and training reinforcement during walks. Monitor dogs for any signs of illness or distress and report concerns to staff. Clean up after dogs during walks and maintain a clean environment. Assist in transporting dogs to and from kennels. Interact positively with potential adopters during walks, showcasing the dogs&#39; personalities.</p>','18','Dog Walker','<p>Passion for animal welfare and experience with dogs preferred. Ability to handle dogs of various sizes and temperaments confidently. Strong communication skills and reliability. Physical capability to walk for extended periods and manage strong dogs. Must be patient, compassionate, and attentive to detail. </p>','<p>Completion of Toe Beans Animal Shelter&#39;s Dog Handling and Safety Training Program, including an orientation session and a supervised walking session with an experienced volunteer.</p>','Open','Minimum of 4 hours per week is required.','','','','Location-3');
CREATE TABLE "VolunteerShiftAssignment__c" (
	id VARCHAR(255) NOT NULL, 
	"VolunteerAccount__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
	"VolunteerShift__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerShiftAssignment__c" VALUES('VolunteerShiftAssignment__c-1','','Contact-10','VolunteerShift__c-2');
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
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-1','','2.0','5.0','2.0','2024-06-06T21:00:00.000+0000','4.0','Location-2','VolunteerActivity__c-3');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-2','','2.0','5.0','2.0','2024-05-30T21:00:00.000+0000','1.0','Location-2','VolunteerActivity__c-3');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-3','','2.0','5.0','2.0','2024-06-20T21:00:00.000+0000','1.0','Location-2','VolunteerActivity__c-3');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-4','','2.0','5.0','2.0','2024-06-13T21:00:00.000+0000','2.0','Location-2','VolunteerActivity__c-3');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-5','<p>Route setup</p>','3.0','5.0','2.0','2024-07-05T19:00:00.000+0000','','','VolunteerActivity__c-1');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-6','<p>Route cleanup</p>','3.0','10.0','2.0','2024-06-30T19:00:00.000+0000','','','VolunteerActivity__c-1');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-7','','2.0','3.0','1.0','2024-07-06T15:00:00.000+0000','','','VolunteerActivity__c-4');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-8','','2.0','3.0','1.0','2024-07-06T17:00:00.000+0000','','','VolunteerActivity__c-4');
INSERT INTO "VolunteerShift__c" VALUES('VolunteerShift__c-9','','2.0','3.0','1.0','2024-07-06T19:00:00.000+0000','','','VolunteerActivity__c-4');
COMMIT;
