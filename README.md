# Vital Records FHIR Messaging

Vital records jurisdictions submit information on deaths in their jurisdiction to the U.S. National Center for Health Statistics (NCHS). For each submission, NCHS codes all causes of death, races, and ethnicities and returns the information to the submitter.

The [Vital Records Death Reporting (VRDR) FHIR IG](http://hl7.org/fhir/us/vrdr/) specifies how to represent the information sent from vital records jurisdictions to NCHS using FHIR documents. It does not specify how such data is exchanged nor how the coding information is represented and returned to the submitter.

[FHIR Messaging](http://hl7.org/fhir/messaging.html) defines how to use FHIR in a message exchange scenario. This document describes the use of FHIR Messaging for:

1. Submission of VRDR documents from vital records jurisdictions to NCHS, and
2. Return of coded causes of death, race, and ethnicity information from NCHS to vital records jurisdictions.

The document can be downloaded in PDF format by

1. Clicking on the release marked "Latest" in the releases section to the right of this page to navigate to the latest release page.
2. Clicking on the fhir_messaging_for_nvss.pdf document in the Assets section of the latest release page.

Questions or comments regarding this document should be directed to the ["Death on FHIR" zulip stream](https://chat.fhir.org/#narrow/stream/179301-Death-on.20FHIR)[^1]. This document will continue to evolve in response to community feedback as well as changes to the VRDR IG or business requirements.

[^1]: https://chat.fhir.org/#narrow/stream/179301-Death-on.20FHIR


## Prerequisites

1. docker  (LaTeX is invoked using a docker image)

## Editing the document

1. Clone this repository
1. Edit the line that read `DOCNAME = deliverable_name` in `Makefile` to set the name of your deliverable 
1. Edit `document.md` and `appendices.md` to enter your content
1. Run `make` in the root of this repository
1. Output is in the `out` directory

This template uses [`pandoc` flavored Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown).

## License

Copyright 2021 The MITRE Corporation

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
```
http://www.apache.org/licenses/LICENSE-2.0
```
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
