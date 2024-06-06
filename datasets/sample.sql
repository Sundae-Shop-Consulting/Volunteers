BEGIN TRANSACTION;
CREATE TABLE "Account" (
	id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"ParentId" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Account" VALUES('Account-1','Sample Account for Entitlements','');
INSERT INTO "Account" VALUES('Account-2','Doe Household','');
INSERT INTO "Account" VALUES('Account-3','Harris Household','');
INSERT INTO "Account" VALUES('Account-4','Young Household','');
INSERT INTO "Account" VALUES('Account-5','Wright Household','');
INSERT INTO "Account" VALUES('Account-6','Scott Household','');
INSERT INTO "Account" VALUES('Account-7','Lewis Household','');
INSERT INTO "Account" VALUES('Account-8','Walker Household','');
INSERT INTO "Account" VALUES('Account-9','Harris Household','');
INSERT INTO "Account" VALUES('Account-10','Wilson Household','');
INSERT INTO "Account" VALUES('Account-11','Scott Household','');
INSERT INTO "Account" VALUES('Account-12','Smith Household','');
INSERT INTO "Account" VALUES('Account-13','Davis Household','');
INSERT INTO "Account" VALUES('Account-14','Jackson Household','');
INSERT INTO "Account" VALUES('Account-15','Wilson Household','');
INSERT INTO "Account" VALUES('Account-16','Robinson Household','');
INSERT INTO "Account" VALUES('Account-17','Jackson Household','');
INSERT INTO "Account" VALUES('Account-18','Wright Household','');
INSERT INTO "Account" VALUES('Account-19','Harris Household','');
INSERT INTO "Account" VALUES('Account-20','Young Household','');
INSERT INTO "Account" VALUES('Account-21','Hall Household','');
INSERT INTO "Account" VALUES('Account-22','Hall Household','');
INSERT INTO "Account" VALUES('Account-23','Allen Household','');
INSERT INTO "Account" VALUES('Account-24','Scott Household','');
INSERT INTO "Account" VALUES('Account-25','Wright Household','');
INSERT INTO "Account" VALUES('Account-26','Hall Household','');
INSERT INTO "Account" VALUES('Account-27','Anderson Household','');
INSERT INTO "Account" VALUES('Account-28','Robinson Household','');
INSERT INTO "Account" VALUES('Account-29','Davis Household','');
INSERT INTO "Account" VALUES('Account-30','Wilson Household','');
INSERT INTO "Account" VALUES('Account-31','Hall Household','');
INSERT INTO "Account" VALUES('Account-32','Walker Household','');
INSERT INTO "Account" VALUES('Account-33','Martinez Household','');
INSERT INTO "Account" VALUES('Account-34','Anderson Household','');
INSERT INTO "Account" VALUES('Account-35','Allen Household','');
INSERT INTO "Account" VALUES('Account-36','Hall Household','');
INSERT INTO "Account" VALUES('Account-37','Harris Household','');
INSERT INTO "Account" VALUES('Account-38','Davis Household','');
INSERT INTO "Account" VALUES('Account-39','Clark Household','');
INSERT INTO "Account" VALUES('Account-40','Robinson Household','');
INSERT INTO "Account" VALUES('Account-41','Davis Household','');
INSERT INTO "Account" VALUES('Account-42','Scott Household','');
INSERT INTO "Account" VALUES('Account-43','King Household','');
INSERT INTO "Account" VALUES('Account-44','Jackson Household','');
INSERT INTO "Account" VALUES('Account-45','Harris Household','');
INSERT INTO "Account" VALUES('Account-46','Walker Household','');
INSERT INTO "Account" VALUES('Account-47','King Household','');
INSERT INTO "Account" VALUES('Account-48','Wright Household','');
INSERT INTO "Account" VALUES('Account-49','Brown Household','');
INSERT INTO "Account" VALUES('Account-50','Allen Household','');
INSERT INTO "Account" VALUES('Account-51','Harris Household','');
INSERT INTO "Account" VALUES('Account-52','King Household','');
INSERT INTO "Account" VALUES('Account-53','Scott Household','');
INSERT INTO "Account" VALUES('Account-54','Wright Household','');
INSERT INTO "Account" VALUES('Account-55','Scott Household','');
INSERT INTO "Account" VALUES('Account-56','Scott Household','');
INSERT INTO "Account" VALUES('Account-57','Brown Household','');
INSERT INTO "Account" VALUES('Account-58','Jackson Household','');
INSERT INTO "Account" VALUES('Account-59','King Household','');
INSERT INTO "Account" VALUES('Account-60','Doe Household','');
INSERT INTO "Account" VALUES('Account-61','Wright Household','');
INSERT INTO "Account" VALUES('Account-62','Clark Household','');
INSERT INTO "Account" VALUES('Account-63','King Household','');
INSERT INTO "Account" VALUES('Account-64','Allen Household','');
INSERT INTO "Account" VALUES('Account-65','Wright Household','');
INSERT INTO "Account" VALUES('Account-66','Anderson Household','');
INSERT INTO "Account" VALUES('Account-67','Clark Household','');
INSERT INTO "Account" VALUES('Account-68','Allen Household','');
INSERT INTO "Account" VALUES('Account-69','Harris Household','');
INSERT INTO "Account" VALUES('Account-70','Wilson Household','');
INSERT INTO "Account" VALUES('Account-71','Anderson Household','');
INSERT INTO "Account" VALUES('Account-72','Robinson Household','');
INSERT INTO "Account" VALUES('Account-73','Wright Household','');
INSERT INTO "Account" VALUES('Account-74','Jackson Household','');
INSERT INTO "Account" VALUES('Account-75','Robinson Household','');
INSERT INTO "Account" VALUES('Account-76','Brown Household','');
INSERT INTO "Account" VALUES('Account-77','Wilson Household','');
INSERT INTO "Account" VALUES('Account-78','Thomas Household','');
INSERT INTO "Account" VALUES('Account-79','Anderson Household','');
INSERT INTO "Account" VALUES('Account-80','Jackson Household','');
INSERT INTO "Account" VALUES('Account-81','Thomas Household','');
INSERT INTO "Account" VALUES('Account-82','King Household','');
INSERT INTO "Account" VALUES('Account-83','Thomas Household','');
INSERT INTO "Account" VALUES('Account-84','Wright Household','');
INSERT INTO "Account" VALUES('Account-85','Wilson Household','');
INSERT INTO "Account" VALUES('Account-86','King Household','');
INSERT INTO "Account" VALUES('Account-87','Doe Household','');
INSERT INTO "Account" VALUES('Account-88','Robinson Household','');
INSERT INTO "Account" VALUES('Account-89','Clark Household','');
INSERT INTO "Account" VALUES('Account-90','Allen Household','');
INSERT INTO "Account" VALUES('Account-91','Davis Household','');
INSERT INTO "Account" VALUES('Account-92','Clark Household','');
INSERT INTO "Account" VALUES('Account-93','Young Household','');
INSERT INTO "Account" VALUES('Account-94','Smith Household','');
INSERT INTO "Account" VALUES('Account-95','Jackson Household','');
INSERT INTO "Account" VALUES('Account-96','Clark Household','');
INSERT INTO "Account" VALUES('Account-97','Brown Household','');
INSERT INTO "Account" VALUES('Account-98','Jackson Household','');
INSERT INTO "Account" VALUES('Account-99','Davis Household','');
INSERT INTO "Account" VALUES('Account-100','Scott Household','');
INSERT INTO "Account" VALUES('Account-101','Anderson Household','');
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
INSERT INTO "Contact" VALUES('Contact-1','False','David','False','False','Doe','Account-2','');
INSERT INTO "Contact" VALUES('Contact-2','False','Samuel','False','False','Harris','Account-3','');
INSERT INTO "Contact" VALUES('Contact-3','False','Laura','False','False','Young','Account-4','');
INSERT INTO "Contact" VALUES('Contact-4','False','Andrew','False','False','Wright','Account-5','');
INSERT INTO "Contact" VALUES('Contact-5','False','Ava','False','False','Scott','Account-6','');
INSERT INTO "Contact" VALUES('Contact-6','False','Olivia','False','False','Lewis','Account-7','');
INSERT INTO "Contact" VALUES('Contact-7','False','Emily','False','False','Walker','Account-8','');
INSERT INTO "Contact" VALUES('Contact-8','False','Charlotte','False','False','Harris','Account-9','');
INSERT INTO "Contact" VALUES('Contact-9','False','Ava','False','False','Wilson','Account-10','');
INSERT INTO "Contact" VALUES('Contact-10','False','Andrew','False','False','Scott','Account-11','');
INSERT INTO "Contact" VALUES('Contact-11','False','Laura','False','False','Smith','Account-12','');
INSERT INTO "Contact" VALUES('Contact-12','False','Mia','False','False','Davis','Account-13','');
INSERT INTO "Contact" VALUES('Contact-13','False','Daniel','False','False','Jackson','Account-14','');
INSERT INTO "Contact" VALUES('Contact-14','False','John','False','False','Wilson','Account-15','');
INSERT INTO "Contact" VALUES('Contact-15','False','Mia','False','False','Robinson','Account-16','');
INSERT INTO "Contact" VALUES('Contact-16','False','Sarah','False','False','Jackson','Account-17','');
INSERT INTO "Contact" VALUES('Contact-17','False','Michael','False','False','Wright','Account-18','');
INSERT INTO "Contact" VALUES('Contact-18','False','Samuel','False','False','Harris','Account-19','');
INSERT INTO "Contact" VALUES('Contact-19','False','Laura','False','False','Young','Account-20','');
INSERT INTO "Contact" VALUES('Contact-20','False','Matthew','False','False','Hall','Account-21','');
INSERT INTO "Contact" VALUES('Contact-21','False','Daniel','False','False','Hall','Account-22','');
INSERT INTO "Contact" VALUES('Contact-22','False','Andrew','False','False','Allen','Account-23','');
INSERT INTO "Contact" VALUES('Contact-23','False','Michael','False','False','Scott','Account-24','');
INSERT INTO "Contact" VALUES('Contact-24','False','Ava','False','False','Wright','Account-25','');
INSERT INTO "Contact" VALUES('Contact-25','False','James','False','False','Hall','Account-26','');
INSERT INTO "Contact" VALUES('Contact-26','False','John','False','False','Anderson','Account-27','');
INSERT INTO "Contact" VALUES('Contact-27','False','Isabella','False','False','Robinson','Account-28','');
INSERT INTO "Contact" VALUES('Contact-28','False','Isabella','False','False','Davis','Account-29','');
INSERT INTO "Contact" VALUES('Contact-29','False','Andrew','False','False','Wilson','Account-30','');
INSERT INTO "Contact" VALUES('Contact-30','False','Laura','False','False','Hall','Account-31','');
INSERT INTO "Contact" VALUES('Contact-31','False','Chris','False','False','Walker','Account-32','');
INSERT INTO "Contact" VALUES('Contact-32','False','Michael','False','False','Martinez','Account-33','');
INSERT INTO "Contact" VALUES('Contact-33','False','John','False','False','Anderson','Account-34','');
INSERT INTO "Contact" VALUES('Contact-34','False','Andrew','False','False','Allen','Account-35','');
INSERT INTO "Contact" VALUES('Contact-35','False','Jane','False','False','Hall','Account-36','');
INSERT INTO "Contact" VALUES('Contact-36','False','David','False','False','Harris','Account-37','');
INSERT INTO "Contact" VALUES('Contact-37','False','Mia','False','False','Davis','Account-38','');
INSERT INTO "Contact" VALUES('Contact-38','False','Daniel','False','False','Clark','Account-39','');
INSERT INTO "Contact" VALUES('Contact-39','False','Olivia','False','False','Robinson','Account-40','');
INSERT INTO "Contact" VALUES('Contact-40','False','Daniel','False','False','Davis','Account-41','');
INSERT INTO "Contact" VALUES('Contact-41','False','Emily','False','False','Scott','Account-42','');
INSERT INTO "Contact" VALUES('Contact-42','False','Matthew','False','False','King','Account-43','');
INSERT INTO "Contact" VALUES('Contact-43','False','David','False','False','Jackson','Account-44','');
INSERT INTO "Contact" VALUES('Contact-44','False','Michael','False','False','Harris','Account-45','');
INSERT INTO "Contact" VALUES('Contact-45','False','Daniel','False','False','Walker','Account-46','');
INSERT INTO "Contact" VALUES('Contact-46','False','Samuel','False','False','King','Account-47','');
INSERT INTO "Contact" VALUES('Contact-47','False','Mia','False','False','Wright','Account-48','');
INSERT INTO "Contact" VALUES('Contact-48','False','James','False','False','Brown','Account-49','');
INSERT INTO "Contact" VALUES('Contact-49','False','Daniel','False','False','Allen','Account-50','');
INSERT INTO "Contact" VALUES('Contact-50','False','Sophia','False','False','Harris','Account-51','');
INSERT INTO "Contact" VALUES('Contact-51','False','Daniel','False','False','King','Account-52','');
INSERT INTO "Contact" VALUES('Contact-52','False','David','False','False','Scott','Account-53','');
INSERT INTO "Contact" VALUES('Contact-53','False','Michael','False','False','Wright','Account-54','');
INSERT INTO "Contact" VALUES('Contact-54','False','Chris','False','False','Scott','Account-55','');
INSERT INTO "Contact" VALUES('Contact-55','False','Joseph','False','False','Scott','Account-56','');
INSERT INTO "Contact" VALUES('Contact-56','False','Sarah','False','False','Brown','Account-57','');
INSERT INTO "Contact" VALUES('Contact-57','False','Chris','False','False','Jackson','Account-58','');
INSERT INTO "Contact" VALUES('Contact-58','False','Ava','False','False','King','Account-59','');
INSERT INTO "Contact" VALUES('Contact-59','False','Andrew','False','False','Doe','Account-60','');
INSERT INTO "Contact" VALUES('Contact-60','False','Laura','False','False','Wright','Account-61','');
INSERT INTO "Contact" VALUES('Contact-61','False','Sophia','False','False','Clark','Account-62','');
INSERT INTO "Contact" VALUES('Contact-62','False','Andrew','False','False','King','Account-63','');
INSERT INTO "Contact" VALUES('Contact-63','False','Laura','False','False','Allen','Account-64','');
INSERT INTO "Contact" VALUES('Contact-64','False','Chris','False','False','Wright','Account-65','');
INSERT INTO "Contact" VALUES('Contact-65','False','Emily','False','False','Anderson','Account-66','');
INSERT INTO "Contact" VALUES('Contact-66','False','Matthew','False','False','Clark','Account-67','');
INSERT INTO "Contact" VALUES('Contact-67','False','Mia','False','False','Allen','Account-68','');
INSERT INTO "Contact" VALUES('Contact-68','False','Charlotte','False','False','Harris','Account-69','');
INSERT INTO "Contact" VALUES('Contact-69','False','Charlotte','False','False','Wilson','Account-70','');
INSERT INTO "Contact" VALUES('Contact-70','False','Jane','False','False','Anderson','Account-71','');
INSERT INTO "Contact" VALUES('Contact-71','False','Olivia','False','False','Robinson','Account-72','');
INSERT INTO "Contact" VALUES('Contact-72','False','David','False','False','Wright','Account-73','');
INSERT INTO "Contact" VALUES('Contact-73','False','Chris','False','False','Jackson','Account-74','');
INSERT INTO "Contact" VALUES('Contact-74','False','Matthew','False','False','Robinson','Account-75','');
INSERT INTO "Contact" VALUES('Contact-75','False','Jane','False','False','Brown','Account-76','');
INSERT INTO "Contact" VALUES('Contact-76','False','Mia','False','False','Wilson','Account-77','');
INSERT INTO "Contact" VALUES('Contact-77','False','Samuel','False','False','Thomas','Account-78','');
INSERT INTO "Contact" VALUES('Contact-78','False','Laura','False','False','Anderson','Account-79','');
INSERT INTO "Contact" VALUES('Contact-79','False','John','False','False','Jackson','Account-80','');
INSERT INTO "Contact" VALUES('Contact-80','False','Daniel','False','False','Thomas','Account-81','');
INSERT INTO "Contact" VALUES('Contact-81','False','Isabella','False','False','King','Account-82','');
INSERT INTO "Contact" VALUES('Contact-82','False','Andrew','False','False','Thomas','Account-83','');
INSERT INTO "Contact" VALUES('Contact-83','False','Olivia','False','False','Wright','Account-84','');
INSERT INTO "Contact" VALUES('Contact-84','False','James','False','False','Wilson','Account-85','');
INSERT INTO "Contact" VALUES('Contact-85','False','Emily','False','False','King','Account-86','');
INSERT INTO "Contact" VALUES('Contact-86','False','Samuel','False','False','Doe','Account-87','');
INSERT INTO "Contact" VALUES('Contact-87','False','Matthew','False','False','Robinson','Account-88','');
INSERT INTO "Contact" VALUES('Contact-88','False','Emily','False','False','Clark','Account-89','');
INSERT INTO "Contact" VALUES('Contact-89','False','Ava','False','False','Allen','Account-90','');
INSERT INTO "Contact" VALUES('Contact-90','False','Isabella','False','False','Davis','Account-91','');
INSERT INTO "Contact" VALUES('Contact-91','False','Sophia','False','False','Clark','Account-92','');
INSERT INTO "Contact" VALUES('Contact-92','False','Emily','False','False','Young','Account-93','');
INSERT INTO "Contact" VALUES('Contact-93','False','Ava','False','False','Smith','Account-94','');
INSERT INTO "Contact" VALUES('Contact-94','False','Andrew','False','False','Jackson','Account-95','');
INSERT INTO "Contact" VALUES('Contact-95','False','Samuel','False','False','Clark','Account-96','');
INSERT INTO "Contact" VALUES('Contact-96','False','Sophia','False','False','Brown','Account-97','');
INSERT INTO "Contact" VALUES('Contact-97','False','Laura','False','False','Jackson','Account-98','');
INSERT INTO "Contact" VALUES('Contact-98','False','James','False','False','Davis','Account-99','');
INSERT INTO "Contact" VALUES('Contact-99','False','Charlotte','False','False','Scott','Account-100','');
INSERT INTO "Contact" VALUES('Contact-100','False','Ava','False','False','Anderson','Account-101','');
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
INSERT INTO "Location" VALUES('Location-4','False','False','Site','Toe Beans Animal Rescue - Main Office','False','');
INSERT INTO "Location" VALUES('Location-5','False','False','Site','Toe Beans Cat Shelter - Shoreline','False','');
INSERT INTO "Location" VALUES('Location-6','False','False','Site','Toe Beans Dog Shelter - Kirkland','False','');
CREATE TABLE "VolunteerActivityAssignment__c" (
	id VARCHAR(255) NOT NULL, 
	"VolunteerAccount__c" VARCHAR(255), 
	"VolunteerActivity__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
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
INSERT INTO "VolunteerActivity__c" VALUES('VolunteerActivity__c-1','<p>Ongoing activity for office related tasks</p>','','','Office Support','','','','');
INSERT INTO "VolunteerActivity__c" VALUES('VolunteerActivity__c-2','<p>Ongoing activity for office related tasks</p>','','','Office Support','','','','');
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
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-1','<p><span style="color: rgb(68, 68, 68);">Administrative volunteers are responsible for performing various tasks that are directly related to various programs around PAWS. These programs could include: Companion Animal Services, Education, Donor &amp; Community Relations, Admin &amp; Finance, or Wildlife.</span></p>','<ul><li>Scan documents and upload them to the server.</li><li>Shred documents.</li><li>Create and keep the Adoption Packet supplies up-to-date and stocked.</li><li>Perform a regular inventory of the retail supplies and restock as needed.</li><li>Create name badges for volunteers.</li><li>Assist with research projects regarding various PAWS programs.</li><li>Creation or organization of items or documents relevant to Education Department.</li><li>Assist with additional administrative duties and projects.</li></ul>','18','Administrative Assistant','<ul><li>Must have basic computer skills</li><li>Good attention to detail</li><li>Complete detailed projects with little supervision</li><li>Be organized, efficient, and flexible, and able to balance projects</li><li>Be able to represent PAWS professionally at all times</li></ul>','<ul><li>Volunteer Orientation</li><li>Info Session</li><li>Training specific to the department in which volunteer is working</li></ul>','Open','Flexible','Location-1');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-2','<p>Join our team at Toe Beans Animal Shelter as a Cat Care Assistant. Provide daily care, enrichment, and socialization for our feline residents. </p>','<p><span style="color: rgb(68, 68, 68);">Duties include feeding, cleaning, grooming, and playing with cats to ensure their well-being and happiness. Help create a loving and safe environment for our cats.</span></p>','18','Cat Care Assistant','<p>Passion for cats and their welfare, basic knowledge of feline behavior, and experience in pet care preferred. Ability to handle cats gently and confidently. Strong attention to detail, good communication skills, and reliability are essential. </p>','','Closed','A minimum of 4 hours per week','Location-2');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-3','<p>Become a Dog Walker at Toe Beans Animal Shelter and help our dogs stay active and healthy. Provide exercise, socialization, and companionship through regular walks. Join us in ensuring our dogs are happy and ready for adoption.</p>','<p>Walk shelter dogs on designated routes, ensuring their safety and well-being. Maintain control of dogs, adhering to shelter guidelines. Provide positive socialization and training reinforcement during walks. Monitor dogs for any signs of illness or distress and report concerns to staff. Clean up after dogs during walks and maintain a clean environment. Assist in transporting dogs to and from kennels. Interact positively with potential adopters during walks, showcasing the dogs&#39; personalities.</p>','18','Dog Walker','<p>Passion for animal welfare and experience with dogs preferred. Ability to handle dogs of various sizes and temperaments confidently. Strong communication skills and reliability. Physical capability to walk for extended periods and manage strong dogs. Must be patient, compassionate, and attentive to detail. </p>','<p>Completion of Toe Beans Animal Shelter&#39;s Dog Handling and Safety Training Program, including an orientation session and a supervised walking session with an experienced volunteer.</p>','Open','Minimum of 4 hours per week is required.','Location-3');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-4','<p><span style="color: rgb(68, 68, 68);">Administrative volunteers are responsible for performing various tasks that are directly related to various programs around PAWS. These programs could include: Companion Animal Services, Education, Donor &amp; Community Relations, Admin &amp; Finance, or Wildlife.</span></p>','<ul><li>Scan documents and upload them to the server.</li><li>Shred documents.</li><li>Create and keep the Adoption Packet supplies up-to-date and stocked.</li><li>Perform a regular inventory of the retail supplies and restock as needed.</li><li>Create name badges for volunteers.</li><li>Assist with research projects regarding various PAWS programs.</li><li>Creation or organization of items or documents relevant to Education Department.</li><li>Assist with additional administrative duties and projects.</li></ul>','18','Administrative Assistant','<ul><li>Must have basic computer skills</li><li>Good attention to detail</li><li>Complete detailed projects with little supervision</li><li>Be organized, efficient, and flexible, and able to balance projects</li><li>Be able to represent PAWS professionally at all times</li></ul>','<ul><li>Volunteer Orientation</li><li>Info Session</li><li>Training specific to the department in which volunteer is working</li></ul>','Open','Flexible','Location-4');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-5','<p>Join our team at Toe Beans Animal Shelter as a Cat Care Assistant. Provide daily care, enrichment, and socialization for our feline residents. </p>','<p><span style="color: rgb(68, 68, 68);">Duties include feeding, cleaning, grooming, and playing with cats to ensure their well-being and happiness. Help create a loving and safe environment for our cats.</span></p>','18','Cat Care Assistant','<p>Passion for cats and their welfare, basic knowledge of feline behavior, and experience in pet care preferred. Ability to handle cats gently and confidently. Strong attention to detail, good communication skills, and reliability are essential. </p>','','Closed','A minimum of 4 hours per week','Location-5');
INSERT INTO "VolunteerPosition__c" VALUES('VolunteerPosition__c-6','<p>Become a Dog Walker at Toe Beans Animal Shelter and help our dogs stay active and healthy. Provide exercise, socialization, and companionship through regular walks. Join us in ensuring our dogs are happy and ready for adoption.</p>','<p>Walk shelter dogs on designated routes, ensuring their safety and well-being. Maintain control of dogs, adhering to shelter guidelines. Provide positive socialization and training reinforcement during walks. Monitor dogs for any signs of illness or distress and report concerns to staff. Clean up after dogs during walks and maintain a clean environment. Assist in transporting dogs to and from kennels. Interact positively with potential adopters during walks, showcasing the dogs&#39; personalities.</p>','18','Dog Walker','<p>Passion for animal welfare and experience with dogs preferred. Ability to handle dogs of various sizes and temperaments confidently. Strong communication skills and reliability. Physical capability to walk for extended periods and manage strong dogs. Must be patient, compassionate, and attentive to detail. </p>','<p>Completion of Toe Beans Animal Shelter&#39;s Dog Handling and Safety Training Program, including an orientation session and a supervised walking session with an experienced volunteer.</p>','Open','Minimum of 4 hours per week is required.','Location-6');
CREATE TABLE "VolunteerShiftAssignment__c" (
	id VARCHAR(255) NOT NULL, 
	"VolunteerAccount__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
	"VolunteerShift__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "VolunteerShift__c" (
	id VARCHAR(255) NOT NULL, 
	"Description__c" VARCHAR(255), 
	"DesiredNumberOfVolunteers__c" VARCHAR(255), 
	"DurationHours__c" VARCHAR(255), 
	"StartDateTime__c" VARCHAR(255), 
	"TotalVolunteers__c" VARCHAR(255), 
	"Location__c" VARCHAR(255), 
	"VolunteerActivity__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
COMMIT;
