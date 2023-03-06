//
// class InterviewFeedback {
//   String? candidateExperience;
//   Skill? communication;
//   Skill? basicOfFlutterDevelopment;
//   Skill? oops;
//   Skill? programingLanguageFramework;
//   Skill? versionControl;
//   Skill? database;
//   Skill? basicConcepts;
//   Skill? codingLogical;
//   Skill? advancedConcepts;
//   Skill? architecturalConcepts;
//   String? result;
//   String? grade;
//
//   InterviewFeedback({
//     this.candidateExperience,
//     this.communication,
//     this.basicOfFlutterDevelopment,
//     this.oops,
//     this.programingLanguageFramework,
//     this.versionControl,
//     this.database,
//     this.basicConcepts,
//     this.codingLogical,
//     this.advancedConcepts,
//     this.architecturalConcepts,
//     this.result,
//     this.grade,
//   });
//
//   InterviewFeedback copyWith({
//     final String? candidateExperience,
//     final Skill? communication,
//     final Skill? basicOfFlutterDevelopment,
//     final Skill? oops,
//     final Skill? programingLanguageFramework,
//     final Skill? versionControl,
//     final Skill? database,
//     final Skill? basicConcepts,
//     final Skill? codingLogical,
//     final Skill? advancedConcepts,
//     final Skill? architecturalConcepts,
//     final String? result,
//     final String? grade,
//   }) {
//     return InterviewFeedback(
//       candidateExperience: candidateExperience ?? this.candidateExperience,
//       communication: communication ?? this.communication,
//       basicOfFlutterDevelopment: basicOfFlutterDevelopment ?? this.basicOfFlutterDevelopment,
//       oops: oops ?? this.oops,
//       programingLanguageFramework: programingLanguageFramework ?? this.programingLanguageFramework,
//       versionControl: versionControl ?? this.versionControl,
//       database: database ?? this.database,
//       basicConcepts: basicConcepts ?? this.basicConcepts,
//       codingLogical: codingLogical ?? this.codingLogical,
//       advancedConcepts: advancedConcepts ?? this.advancedConcepts,
//       architecturalConcepts: architecturalConcepts ?? this.architecturalConcepts,
//       result: result ?? this.result,
//       grade: grade ?? this.grade,
//     );
//   }
// }
//
// class Skill {
//   String? question;
//   String? rating;
//
//   Skill({
//     required this.question,
//     this.rating,
//   });
// }
