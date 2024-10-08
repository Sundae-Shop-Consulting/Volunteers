# Volunteers
This is an open source volunteer management application for Salesforce. The MVP will target volunteer manager use cases: Finding and assigning volunteers, reporting on volunteer data, and managing volunteer activities. The short-term goal of the project is to complete an MVP version of internal, volunteer manager features of [Volunteers for Salesforce](https://appexchange.salesforce.com/appxListingDetail?listingId=a0N30000003JBggEAG). 

This project is:
- Conceptually based on the features supported in Volunteers for Salesforce, but built on a [new data model](https://github.com/Sundae-Shop-Consulting/Volunteers/wiki/Data-Model) compatible with a broader range of licenses.
- Will be compatible with either NPSP or NPC. 

Additional information about data model and features can be found in the [project wiki](https://github.com/Sundae-Shop-Consulting/Volunteers/wiki).

Email laura@sundaeshopconsulting.com to get involved.

# Dev Org Setup
This project uses CumulusCI to manage development environments. For more information, see [Getting Started on CumulusCI](https://cumulusci.readthedocs.io/en/stable/get-started.html). 

Once you've set up CumulusCI, you can get a scratch org with an unmanaged version of the Volunteers project configured with sample data by running:

`cci org scratch dev dev --default`

`cci flow run dev_org`

## Sample Data 

Update data model for sample data. Review this file after generating as it may include objects you don't want.
`cci task run generate_dataset_mapping --path datasets/mapping.yml`

### Animal shelter dataset

Extract dataset
`cci task run extract_dataset --mapping datasets/mapping.yml --sql_path datasets/sample-animalshelter.sql`

Load data
`cci task run load_dataset --mapping datasets/mapping.yml --sql_path datasets/sample-animalshelter.sql`



# Repo Setup
This project is preconfigured with D2X for a comprehensive Development-to-Delivery Experience including CI/CD using GitHub Actions and development environments using GitHub Codespaces.

D2X requires some minimal configuration of your GitHub organization or repository to complete the setup and enable builds:
* [Configure Secrets](https://d2x.readthedocs.io/en/latest/tutorial/#secrets)
* [Develop Your First Change](https://d2x.readthedocs.io/en/latest/tutorial/#develop)
* [Merge Your First Change](https://d2x.readthedocs.io/en/latest/tutorial/#merge)
* [Release Your First Change](https://d2x.readthedocs.io/en/latest/tutorial/#release)

You can check the status of your setup by monitoring the status of the following GitHub Actions workflows:
* [![2GP Feature Test](https://github.com/lmeerkatz/Volunteers/actions/workflows/feature.yml/badge.svg)](https://github.com/lmeerkatz/Volunteers/actions/workflows/feature.yml)
* [![Beta Test](https://github.com/lmeerkatz/Volunteers/actions/workflows/beta.yml/badge.svg)](https://github.com/lmeerkatz/Volunteers/actions/workflows/beta.yml)
* [![Production Release](https://github.com/lmeerkatz/Volunteers/actions/workflows/release.yml/badge.svg)](https://github.com/lmeerkatz/Volunteers/actions/workflows/release.yml)
