# HospitalSyncApp

A Rails application for syncing patient data across multiple doctors.

## Setup Instructions

1. Clone the repository.
2. Run `bundle install` to install required gems.
3. Set up the database with `rails db:create db:migrate`.
4. Start the server with `rails server`.

## API Endpoints

- `POST /api/v1/sync`: Synchronizes patient data.
- `GET /api/v1/patients`: Fetches all patients.
- `PUT /api/v1/patients/:id`: Updates a patient's information.
