import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vrna_app_mobile/src/blocs/actordetails.bloc.dart';
import 'package:vrna_app_mobile/src/widgets/loading.dart';
import 'package:vrna_app_mobile/src/pages/actordetails/actor.details.widget.dart';
import 'package:vrna_app_mobile/src/widgets/background.dart';

class ActorDetailsPage extends StatefulWidget {
  const ActorDetailsPage({Key key, this.actorId}) : super(key: key);

  @override
  _ActorDetailsPageState createState() => _ActorDetailsPageState();
  final int actorId;
}

class _ActorDetailsPageState extends State<ActorDetailsPage>
    with ActorDetailsWidget {
  ActorDetailsBloc bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = Provider.of<ActorDetailsBloc>(context);
    bloc.getActorDetails(context, widget.actorId);
    bloc.getMoviesByActor(context, widget.actorId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Loading(
            message: "Loading ...",
            status: bloc.loading,
            child: Scaffold(
                body: Container(
                    child: actorDetails(context, bloc)))));
  }
}
