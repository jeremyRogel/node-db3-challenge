const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where("id", id)
    .first();
}

function findSteps(id) {
  return db("steps as step")
    .join("schemes as s", "step.scheme_id", "s.id")
    .select("step.id", "s.scheme_name", "step.step_number", "step.instructions")
    .where({ scheme_id: id });
}

function add(scheme) {
  return db("schemes")
    .insert(scheme, "id")
    .then(([id]) => {
      return findById(id);
    });
}

function addStep(step, scheme_id) {
  return db("steps")
    .insert({ ...step, scheme_id })
    .then(([id]) => {
      return db("steps").where({ id });
    });
}

function update(changes, id) {
    console.log(changes,id)
  return db("schemes")
    .update(changes)
    .where("id", Number(id))
    .then(() => {
      return findById(id);
    });
}

function remove(id) {
  return db("schemes")
    .where({ id })
    .del();
}