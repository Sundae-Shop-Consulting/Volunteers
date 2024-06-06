# Volunteers
An open source volunteer management application for Salesforce. The MVP will target volunteer manager use cases: Finding and assigning volunteers, reporting on volunteer data, and managing volunteer activities.

- Conceptually based on the features supported in Volunteers for Salesforce, but built on a new data model compatible with a broader range of licenses.
- Will support modeling volunteers as Contacts or Person Accounts to ensure compatibility with either NPSP or NPC.


# Dev Org Setup
`cci org scratch dev dev --default`
`cci flow run dev_org`
`cci task run load_dataset --mapping datasets/mapping.yml --sql_path datasets/sample.sql`

## Sample Data 

Update data model for sample data
`cci task run generate_dataset_mapping --path datasets/mapping.yml`

Extract dataset
`cci task run extract_dataset --mapping datasets/mapping.yml --sql_path datasets/sample.sql`

Load data
`cci task run load_dataset --mapping datasets/mapping.yml --sql_path datasets/sample.sql`



# Project Setup
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
