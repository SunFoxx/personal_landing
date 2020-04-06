import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sunfoxx_landing/state/model/skill.dart';
import 'package:sunfoxx_landing/state/page_state.dart';

class PageStateController {
  PageState _model;
  Firestore _firestore;

  PageStateController(this._model) : _firestore = Firestore.instance;

  fetchSkills() async {
    List<Skill> skills = await _firestore
        .collection('skills')
        .getDocuments()
        .then((QuerySnapshot querySnapshot) =>
            querySnapshot.documents.map((e) => Skill.fromMap(e.data)).toList()
              ..sort((a, b) => b.rating - a.rating));
    _model.skills = skills;
  }
}
