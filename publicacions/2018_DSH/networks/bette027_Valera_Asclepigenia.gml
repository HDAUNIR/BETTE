graph [
  node [
    id 0
    label "#proc"
    nature "person"
    role "lover"
    importance "primary"
    sex "M"
  ]
  node [
    id 1
    label "#mari"
    nature "person"
    role "other"
    importance "minor"
    sex "M"
  ]
  node [
    id 2
    label "#mort"
    nature "non-human"
    role "other"
    importance "minor"
    sex "0"
  ]
  node [
    id 3
    label "#ascl"
    nature "person"
    role "protagonist"
    importance "primary"
    sex "F"
  ]
  node [
    id 4
    label "#aten"
    nature "person"
    role "other"
    importance "minor"
    sex "M"
  ]
  node [
    id 5
    label "#eumo"
    nature "person"
    role "antagonist"
    importance "secondary"
    sex "M"
  ]
  node [
    id 6
    label "#crem"
    nature "person"
    role "antagonist"
    importance "secondary"
    sex "M"
  ]
  node [
    id 7
    label "#sier"
    nature "person"
    role "other"
    importance "minor"
    sex "F"
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
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 2
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 3
    Weight 4.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 5
    Weight 5.0
    Type "Undirected"
  ]
  edge [
    source 0
    target 6
    Weight 3.0
    Type "Undirected"
  ]
  edge [
    source 1
    target 5
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 2
    target 4
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 2
    target 3
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 3
    target 4
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
    source 3
    target 6
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 3
    target 7
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 4
    target 7
    Weight 1.0
    Type "Undirected"
  ]
  edge [
    source 5
    target 6
    Weight 2.0
    Type "Undirected"
  ]
]
