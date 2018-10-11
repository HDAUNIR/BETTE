graph [
  node [
    id 0
    label "#aten"
    sex "M"
    importance "minor"
    nature "person"
    role "other"
  ]
  node [
    id 1
    label "#proc"
    sex "M"
    importance "primary"
    nature "person"
    role "lover"
  ]
  node [
    id 2
    label "#eumo"
    sex "M"
    importance "secondary"
    nature "person"
    role "antagonist"
  ]
  node [
    id 3
    label "#sier"
    sex "F"
    importance "minor"
    nature "person"
    role "other"
  ]
  node [
    id 4
    label "#crem"
    sex "M"
    importance "secondary"
    nature "person"
    role "antagonist"
  ]
  node [
    id 5
    label "#mari"
    sex "M"
    importance "minor"
    nature "person"
    role "other"
  ]
  node [
    id 6
    label "#mort"
    sex "0"
    importance "minor"
    nature "non-human"
    role "other"
  ]
  node [
    id 7
    label "#ascl"
    sex "F"
    importance "primary"
    nature "person"
    role "protagonist"
  ]
  edge [
    source 0
    target 3
    Type "Undirected"
    Weight 1.0
  ]
  edge [
    source 0
    target 1
    Type "Undirected"
    Weight 1.0
  ]
  edge [
    source 0
    target 6
    Type "Undirected"
    Weight 1.0
  ]
  edge [
    source 0
    target 7
    Type "Undirected"
    Weight 2.0
  ]
  edge [
    source 1
    target 2
    Type "Undirected"
    Weight 5.0
  ]
  edge [
    source 1
    target 4
    Type "Undirected"
    Weight 3.0
  ]
  edge [
    source 1
    target 5
    Type "Undirected"
    Weight 3.0
  ]
  edge [
    source 1
    target 6
    Type "Undirected"
    Weight 1.0
  ]
  edge [
    source 1
    target 7
    Type "Undirected"
    Weight 4.0
  ]
  edge [
    source 2
    target 5
    Type "Undirected"
    Weight 1.0
  ]
  edge [
    source 2
    target 4
    Type "Undirected"
    Weight 2.0
  ]
  edge [
    source 2
    target 7
    Type "Undirected"
    Weight 1.0
  ]
  edge [
    source 3
    target 7
    Type "Undirected"
    Weight 1.0
  ]
  edge [
    source 4
    target 7
    Type "Undirected"
    Weight 1.0
  ]
  edge [
    source 6
    target 7
    Type "Undirected"
    Weight 1.0
  ]
]
