graph [
  node [
    id 0
    label "#eust"
    sex "F"
    importance "secondary"
    nature "person"
    role "other"
  ]
  node [
    id 1
    label "#rosa"
    sex "F"
    importance "secondary"
    nature "person"
    role "other"
  ]
  node [
    id 2
    label "#marc"
    sex "M"
    importance "secondary"
    nature "person"
    role "other"
  ]
  node [
    id 3
    label "#fedr"
    sex "F"
    importance "primary"
    nature "person"
    role "protagonist"
  ]
  node [
    id 4
    label "#hipo"
    sex "M"
    importance "primary"
    nature "person"
    role "lover"
  ]
  node [
    id 5
    label "#pedr"
    sex "M"
    importance "primary"
    nature "person"
    role "antagonist"
  ]
  edge [
    source 0
    target 2
    Type "Undirected"
    Weight 2.0
  ]
  edge [
    source 0
    target 3
    Type "Undirected"
    Weight 4.0
  ]
  edge [
    source 0
    target 4
    Type "Undirected"
    Weight 5.0
  ]
  edge [
    source 0
    target 5
    Type "Undirected"
    Weight 4.0
  ]
  edge [
    source 0
    target 1
    Type "Undirected"
    Weight 1.0
  ]
  edge [
    source 1
    target 3
    Type "Undirected"
    Weight 2.0
  ]
  edge [
    source 2
    target 3
    Type "Undirected"
    Weight 2.0
  ]
  edge [
    source 2
    target 5
    Type "Undirected"
    Weight 3.0
  ]
  edge [
    source 3
    target 4
    Type "Undirected"
    Weight 5.0
  ]
  edge [
    source 3
    target 5
    Type "Undirected"
    Weight 7.0
  ]
  edge [
    source 4
    target 5
    Type "Undirected"
    Weight 6.0
  ]
]
