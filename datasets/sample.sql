BEGIN TRANSACTION;
CREATE TABLE "Contact" (
	id VARCHAR(255) NOT NULL, 
	"DoNotCall" VARCHAR(255), 
	"FirstName" VARCHAR(255), 
	"HasOptedOutOfEmail" VARCHAR(255), 
	"HasOptedOutOfFax" VARCHAR(255), 
	"LastName" VARCHAR(255), 
	"ReportsToId" VARCHAR(255), 
	PRIMARY KEY (id)
);
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
CREATE TABLE "VolunteerActivityPosition__c" (
	id VARCHAR(255) NOT NULL, 
	"NumberOfVolunteersAssigned__c" VARCHAR(255), 
	"VolunteerActivity__c" VARCHAR(255), 
	"VolunteerPosition__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "VolunteerActivityPosition__c" VALUES('VolunteerActivityPosition__c-1','5.0','Volunteer_Activity__c-1','VolunteerPosition__c-1');
CREATE TABLE "VolunteerAssignment__c" (
	id VARCHAR(255) NOT NULL, 
	"VolunteerActivityPosition__c" VARCHAR(255), 
	"VolunteerShift__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "VolunteerHoursLog__c" (
	id VARCHAR(255) NOT NULL, 
	"Comments__c" VARCHAR(255), 
	"EndDateTime__c" VARCHAR(255), 
	"Hours__c" VARCHAR(255), 
	"StartDateTime__c" VARCHAR(255), 
	"VolunteerContact__c" VARCHAR(255), 
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
CREATE TABLE "VolunteerShift__c" (
	id VARCHAR(255) NOT NULL, 
	"Description__c" VARCHAR(255), 
	"DesiredNumberOfVolunteers__c" VARCHAR(255), 
	"DurationHours__c" VARCHAR(255), 
	"StartDateTime__c" VARCHAR(255), 
	"TotalVolunteers__c" VARCHAR(255), 
	"Location__c" VARCHAR(255), 
	PRIMARY KEY (id)
);
CREATE TABLE "Volunteer_Activity__c" (
	id VARCHAR(255) NOT NULL, 
	"Description__c" VARCHAR(255), 
	"Name" VARCHAR(255), 
	PRIMARY KEY (id)
);
INSERT INTO "Volunteer_Activity__c" VALUES('Volunteer_Activity__c-1','<p>Ongoing activity for office related tasks</p>','Office Support');
COMMIT;
