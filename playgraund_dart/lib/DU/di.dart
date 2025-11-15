MultiBlocProvider(
  providers: [
    RepositoryProvider(create: (_) => AuthRepository()),
    BlocProvider(create: (context) => LoginBloc(
        context.read<AuthRepository>(),
    )),
  ],
  child: MyApp(),
);
// dependacy injection