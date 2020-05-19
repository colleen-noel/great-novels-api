module.exports = {
  up: async (queryInterface, Sequelize) => {
    /*
      Add altering commands here.
      Return a promise to correctly handle asynchronicity.

      Example:
      return queryInterface.createTable('users', { id: Sequelize.INTEGER });
    */
    const buildAuthorsTableTask = queryInterface.createTable('authors', {
      id: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
      firstName: { type: Sequelize.STRING },
      lastName: { type: Sequelize.STRING },
      createdAt: { type: Sequelize.DATE, defaultValue: Sequelize.literal('CURRENT_TIMESTAMP') },
      updatedAt: {
        type: Sequelize.DATE, defaultValue: Sequelize.literal('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP')
      },
      deletedAt: { type: Sequelize.DATE }
    })

    const buildGenresTableTask = queryInterface.createTable('genres', {
      id: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
      name: { type: Sequelize.STRING },
      createdAt: { type: Sequelize.DATE, defaultValue: Sequelize.literal('CURRENT_TIMESTAMP') },
      updatedAt: {
        type: Sequelize.DATE, defaultValue: Sequelize.literal('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP')
      },
      deletedAt: { type: Sequelize.DATE }
    })

    await buildAuthorsTableTask

    const buildNovelsTableTask = queryInterface.createTable('novels', {
      id: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
      title: { type: Sequelize.STRING },
      authorId: { type: Sequelize.INTEGER, references: { model: 'Authors', key: 'id' } },
      createdAt: { type: Sequelize.DATE, defaultValue: Sequelize.literal('CURRENT_TIMESTAMP') },
      updatedAt: {
        type: Sequelize.DATE, defaultValue: Sequelize.literal('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP')
      },
      deletedAt: { type: Sequelize.DATE }
    })

    await buildGenresTableTask
    await buildNovelsTableTask

    await queryInterface.createTable('novelsGenres', {
      novelId: { type: Sequelize.INTEGER, references: { model: 'Novels', key: 'id' } },
      genreId: { type: Sequelize.INTEGER, references: { model: 'Genres', key: 'id' } },
      createdAt: { type: Sequelize.DATE, defaultValue: Sequelize.literal('CURRENT_TIMESTAMP') },
      updatedAt: {
        type: Sequelize.DATE, defaultValue: Sequelize.literal('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP')
      },
      deletedAt: { type: Sequelize.DATE }
    })
  },

  down: async (queryInterface) => {
    /*
      Add reverting commands here.
      Return a promise to correctly handle asynchronicity.

      Example:
      return queryInterface.dropTable('users');
    */
    await queryInterface.dropTable('novelsGenres')

    await queryInterface.dropTable('genres')

    await queryInterface.dropTable('novels')

    await queryInterface.dropTable('authors')
  }
}
