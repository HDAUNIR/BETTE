graph [
  node [
    id 0
    label "#marc"
    sex "M"
    role "other"
    nature "person"
    importance "secondary"
  ]
  node [
    id 1
    label "#pedr"
    sex "M"
    role "antagonist"
    nature "person"
    importance "primary"
  ]
  node [
    id 2
    label "#eust"
    sex "F"
    role "other"
    nature "person"
    importance "secondary"
  ]
  node [
    id 3
    label "#hipo"
    sex "M"
    role "lover"
    nature "person"
    importance "primary"
  ]
  node [
    id 4
    label "#fedr"
    sex "F"
    role "protagonist"
    nature "person"
    importance "primary"
  ]
  node [
    id 5
    label "#rosa"
    sex "F"
    role "other"
    nature "person"
    importance "secondary"
  ]
  edge [
    source 0
    target 2
    Weight 2.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 1
    Weight 3.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 4
    Weight 2.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 2
    Weight 4.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 3
    Weight 6.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 4
    Weight 7.0
    Type "Undirected"
  ]
  edge [
    source 2
    target 3
    Weight 5.0
    Type "Undirected"
  ]
  edge [
    source 2
    target 4
    Weight 4.0
    Type "Undirected"
  ]
  edge [
    source 2
    target 5
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 3
    target 4
    Weight 5.0
    Type "Undirected"
  ]
  edge [
    source 4
    target 5
    Weight 2.0
    Type "Undirected"
  ]
]
