---
title: Sidon-set review policy
version: 1
required_roles:
  low_risk:
    - local_reviewer
  source_repair:
    - source_reviewer
  entity_issue:
    - notation_reviewer
  confidence_change:
    - domain_reviewer
    - method_reviewer
  contradiction_change:
    - domain_reviewer
    - method_reviewer
  decision_impact:
    - frontier_reviewer
  retraction_impact:
    - domain_reviewer
    - method_reviewer
---

Review policy for the Sidon-set additive-combinatorics frontier.

Source and locator repairs require a typed reviewer id, a bounded reason, and
a source or evidence reference. Bound changes, confidence changes, contradicted
claims, and proof-script interpretation require domain and method review. Agent
or computational output remains proposal material until accepted through local
review.
