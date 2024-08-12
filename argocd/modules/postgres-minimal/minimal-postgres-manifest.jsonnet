[
  {
    apiVersion: 'acid.zalan.do/v1',
    kind: 'postgresql',
    metadata: {
      name: 'acid-simple-cluster',
    },
    spec: {
      teamId: 'acid',
      volume: {
        size: '1Gi',
        storageClass: std.extVar('storage_class'),
      },
      numberOfInstances: 2,
      users: {
        testuser: [
          'superuser',
          'createdb',
        ]
      },
      databases: {
        testuserdb: 'testuser',
      },
      postgresql: {
        version: '15',
      },
    },
  },
]
