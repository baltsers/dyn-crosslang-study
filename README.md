# dyn-crosslang-study

Project artifact for:

**Language-Agnostic Dynamic Analysis of Multilingual Code: Promises, Pitfalls, and Prospects**

- Original artifact URL: <https://bitbucket.org/hcailab/dyncrosslangstudy>
- Imported via `pubs2github` from the publications page
- Downloader: `git` — Cloned https://bitbucket.org/hcailab/dyncrosslangstudy.git (12584 files)


This repository was created automatically. The contents under this
directory mirror what was downloaded from the original artifact link
above; refer to that source for the authoritative version, licensing,
and any updates.

---

## Original `README.md` (from the upstream artifact)

# README #

A comparative study of existing cross-language dynamic analysis techniques (ORBS)

## ORBS ##
10 projects done.
Mongo
Deap
Pyrasite
Pyjnius
Pysonar2
Affinity
Vertx
Snappy
sbe
brotli



### How to run ORBS ###
1. Configuration

Configure the ORBS using the five script files located at ./projects/project name>/config/

2. Running

sudo bash ./projects/<project name>/timeout.sh
This script will automatically run the ORBS; stop running ORBS once running for over 24 hours.

### Organization ###
./orbs/ ORBS main code

./projects/ 10 projects and their slicing results.

./OBRS-results-updated.xlsx ORBS running results.

./Repository_List.csv 40001 projects collected from the GitHub.
