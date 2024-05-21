cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  menorrhagia-and-polymenorrhoea-epimenorrhoea---primary:
    run: menorrhagia-and-polymenorrhoea-epimenorrhoea---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  menorrhagia-and-polymenorrhoea-bleeding---primary:
    run: menorrhagia-and-polymenorrhoea-bleeding---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: menorrhagia-and-polymenorrhoea-epimenorrhoea---primary/output
  menorrhagia-and-polymenorrhoea-menstruation---primary:
    run: menorrhagia-and-polymenorrhoea-menstruation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: menorrhagia-and-polymenorrhoea-bleeding---primary/output
  menorrhagia-and-polymenorrhoea-period---primary:
    run: menorrhagia-and-polymenorrhoea-period---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: menorrhagia-and-polymenorrhoea-menstruation---primary/output
  menorrhagia-and-polymenorrhoea---primary:
    run: menorrhagia-and-polymenorrhoea---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: menorrhagia-and-polymenorrhoea-period---primary/output
  menorrhagia---primary:
    run: menorrhagia---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: menorrhagia-and-polymenorrhoea---primary/output
  menorrhagia-and-polymenorrhoea-hypermenorrhoea---primary:
    run: menorrhagia-and-polymenorrhoea-hypermenorrhoea---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: menorrhagia---primary/output
  polymenorrhoea---primary:
    run: polymenorrhoea---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: menorrhagia-and-polymenorrhoea-hypermenorrhoea---primary/output
  frequent-menorrhagia-and-polymenorrhoea---primary:
    run: frequent-menorrhagia-and-polymenorrhoea---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: polymenorrhoea---primary/output
  menorrhagia-and-polymenorrhoea-premenopausal---primary:
    run: menorrhagia-and-polymenorrhoea-premenopausal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: frequent-menorrhagia-and-polymenorrhoea---primary/output
  menorrhagia-and-polymenorrhoea-cycle---primary:
    run: menorrhagia-and-polymenorrhoea-cycle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: menorrhagia-and-polymenorrhoea-premenopausal---primary/output
  menorrhagia-and-polymenorrhoea-history---primary:
    run: menorrhagia-and-polymenorrhoea-history---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: menorrhagia-and-polymenorrhoea-cycle---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: menorrhagia-and-polymenorrhoea-history---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
