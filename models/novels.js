const novels = (connection, Sequelize, Authors) => {
  return connection.define('novels', {
    Id: { type: Sequelize.INTEGER, autoincrement: true, primaryKey: true },
    Title: { type: Sequelize.STRING },
    authorId: { type: Sequelize.INTEGER, references: { model: Authors, key: 'Id' } }
  }, {
    defaultScope: {
      attributes: { exclude: ['deletedAt'] }
    }
  }, {
    paranoid: true,
  })
}

module.exports = novels

