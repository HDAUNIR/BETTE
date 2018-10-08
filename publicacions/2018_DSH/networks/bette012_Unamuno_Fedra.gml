graph [
  node [
    id 0
    label "#eust"
    nature "person"
    role "other"
    importance "secondary"
    sex "F"
  ]
  node [
    id 1
    label "#fedr"
    nature "person"
    role "protagonist"
    importance "primary"
    sex "F"
  ]
  node [
    id 2
    label "#pedr"
    nature "person"
    role "antagonist"
    importance "primary"
    sex "M"
  ]
  node [
    id 3
    label "#hipo"
    nature "person"
    role "lover"
    importance "primary"
    sex "M"
  ]
  node [
    id 4
    label "#marc"
    nature "person"
    role "other"
    importance "secondary"
    sex "M"
  ]
  node [
    id 5
    label "#rosa"
    nature "person"
    role "other"
    importance "secondary"
    sex "F"
  ]
  edge [
    source 0
    target 3
    Weight 5.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 4
    Weight 2.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 1
    Weight 4.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 5
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 2
    Weight 4.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 3
    Weight 5.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 4
    Weight 2.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 5
    Weight 2.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 2
    Weight 7.0
    Type "Undirected"
  ]
  edge [
    source 2
    target 3
    Weight 6.0
    Type "Undirected"
  ]
  edge [
    source 2
    target 4
    Weight 3.0
    Type "Undirected"
  ]
]
