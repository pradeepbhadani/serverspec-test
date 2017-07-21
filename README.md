# Serverspec test

## Pre-requiste
You should have following to run these serverspec tests
* Ruby 2.4.1
* bundler

## Environment Variable

| Name              | Description                                     |
| ----              | -----------                                     |
| SSH_USER          | User to connect to remote machine               |
| SSH_KEY           | Private key of user to login to remote machine  |
| ASK_SSH_PASSWORD  | Set if you want to type password on console     |
| SSH_PASSWORD      | user password                                   |
| SSH_PORT          | Custom SSH Port                                 |
| RESULT_PATH       | Local directory path to store result            |
| HOSTS_FILE        | Path to hosts file                              |


## How to Run
1. Clone this repo
2. Run `bundle` to install all required gems.
3. Define host ip and roles to test in a yaml file.
4. Run command<br>
`HOSTS_YAML=example/host.yaml SSH_USER=vagrant SSH_KEY=~/.ssh/mylittlekey.pem RESULT_PATH=/tmp/ rake spec`
5. Navigate to `RESULT_PATH` to see `html` and `json` output of tests.
