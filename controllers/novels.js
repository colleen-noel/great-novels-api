const models = require('../models')

const getAllNovelsWithAuthorAndGenre = async (request, response) => {
  try {
    const allNovels = await models.Novels.findAll({
      include: [
        { model: models.Authors },
        { model: models.Genres }]
    })

    allNovels.forEach(novel => novel.genres.sort((lhs, rhs) => {
      if (lhs.name < rhs.name) {
        return -1
      }
      else if (lhs.name > rhs.name) {
        return 1
      }
      else {
        return 0
      }
    }))

    return (allNovels)
      ? response.send(allNovels)
      : response.sendStatus(404)
  } catch (error) {
    response.status(500).send('Unable to retrieve novels, please try again')
  }
}

const getNovelbySlugType = (request, response) => {
  const { slug } = request.params

  const isNum = !isNaN(slug)

  if (isNum) {
    return getNovelByIdWithAuthorAndGenre(slug, response)
  }
  else {
    return getNovelByTitleWithAuthorAndGenre(slug, response)
  }
}

const getNovelByIdWithAuthorAndGenre = async (id, response) => {
  try {
    const novel = await models.Novels.findOne({
      where: { Id: id },
      include: [
        { model: models.Authors },
        { model: models.Genres }]
    })

    return novel
      ? response.send(novel)
      : response.sendStatus(404)
  } catch (error) {
    response.status(500).send('Unable to retrieve novel, please try again')
  }
}

const getNovelByTitleWithAuthorAndGenre = async (title, response) => {
  try {
    const novelsTitle = await models.Novels.findOne({
      attributes: ['id', 'title', 'authorId', 'createdAt', 'updatedAt'],
      where: {
        title: { [models.Op.like]: `%${title}%` },
      },

      include: [
        {
          model: models.Authors,
          attributes: ['id', 'firstName', 'lastName', 'createdAt', 'updatedAt']
        },
        {
          model: models.Genres,
          attributes: ['id', 'name', 'createdAt', 'updatedAt']
        },
      ]
    })


    return novelsTitle
      ? response.send(novelsTitle)
      : response.status(404).send('nope')
  } catch (error) {
    response.status(500).send('Unable to retrieve novel, please try again')
  }
}

module.exports = { getAllNovelsWithAuthorAndGenre, getNovelbySlugType }
