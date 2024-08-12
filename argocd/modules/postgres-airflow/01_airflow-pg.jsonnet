[
  {
    apiVersion: 'acid.zalan.do/v1',
    kind: 'postgresql',
    metadata: {
      name: 'data-airflow-cls',
      namespace: std.extVar('namespace'),
      labels: {
        app: 'airflow-pg',
      },
    },
    spec: {
      teamId: 'data',
      volume: {
        size: '1Gi',
        storageClass: 'standard', // switch to variable std.extVar('storage_class')
      },
      numberOfInstances: 2,
      users: {
        airflow_user: [
          'createdb',
          'login',
        ],
      },
      databases: {
        airflow_db: 'airflow_user',
      },
      postgresql: {
        version: '15',
      },
      resources: {
        requests: {
          cpu: '250m',
          memory: '256Mi',
        },
        limits: {
          cpu: '500m',
          memory: '1Gi',
        },
      },
      patroni: {
        pg_hba: [
          'local   all             all            trust',
          'host    all             all            127.0.0.1/32       md5',
          'host    all             all            ::1/128            md5',
          'local   replication     standby                    trust',
          'hostssl replication     standby        all                md5',
          'hostssl all             airflow_user   0.0.0.0/0 md5',
          'host    all             airflow_user   0.0.0.0/0 md5',
          'hostnossl all           all            all                reject',
          'hostssl all             all            all                md5',
        ],
      },
      sidecars: [
        {
          name: 'exporter',
          image: 'wrouesnel/postgres_exporter',
          ports: [
            {
              name: 'exporter',
              containerPort: 9187,
              protocol: 'TCP',
            },
          ],
          resources: {
            limits: {
              cpu: '500m',
              memory: '256M',
            },
            requests: {
              cpu: '100m',
              memory: '200M',
            },
          },
        },
      ],
    },
  },
]