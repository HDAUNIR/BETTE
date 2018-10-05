graph [
  node [
    id 0
    label "#aten"
    sex "M"
    role "other"
    nature "person"
    importance "minor"
  ]
  node [
    id 1
    label "#proc"
    sex "M"
    role "lover"
    nature "person"
    importance "primary"
  ]
  node [
    id 2
    label "#crem"
    sex "M"
    role "antagonist"
    nature "person"
    importance "secondary"
  ]
  node [
    id 3
    label "#mort"
    sex "0"
    role "other"
    nature "non-human"
    importance "minor"
  ]
  node [
    id 4
    label "#sier"
    sex "F"
    role "other"
    nature "person"
    importance "minor"
  ]
  node [
    id 5
    label "#ascl"
    sex "F"
    role "protagonist"
    nature "person"
    importance "primary"
  ]
  node [
    id 6
    label "#mari"
    sex "M"
    role "other"
    nature "person"
    importance "minor"
  ]
  node [
    id 7
    label "#eumo"
    sex "M"
    role "antagonist"
    nature "person"
    importance "secondary"
  ]
  edge [
    source 0
    target 4
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 5
    Weight 2.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 1
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 3
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 7
    Weight 5.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 2
    Weight 3.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 3
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 5
    Weight 4.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 6
    Weight 3.0
    Type "Undirected"
  ]
  edge [
    source 2
    target 5
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 2
    target 7
    Weight 2.0
    Type "Undirected"
  ]
  edge [
    source 3
    target 5
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 4
    target 5
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 5
    target 7
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 6
    target 7
    Weight 1.0
    Type "Undirected"
  ]
]
